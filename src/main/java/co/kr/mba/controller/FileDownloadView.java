package co.kr.mba.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.util.FileCopyUtils;
import org.springframework.web.servlet.view.AbstractView;

public class FileDownloadView extends AbstractView{

	@Override
	protected void renderMergedOutputModel(Map<String, Object> model,
			HttpServletRequest request, HttpServletResponse response) throws Exception {

		String filename = (String) model.get("filename");
		String filepath = (String) model.get("filepath");
		 /*String defaultPath = httpSession.getServletContext().getRealPath("/");
         File file = new File(defaultPath+File.separator +"resources"+File.separator +"naver" +File.separator + fileName);*/
		// 파일을 읽어오는 스트림 얻기
		//File file = new File("C:/workspace/vcatch/src/main/webapp/resources/file", filename);
		File file = new File(filepath, filename);
		
		FileInputStream fis = new FileInputStream(file);
		// 파일다운로드하기
		filename = URLEncoder.encode(filename, "utf-8");	// 다운로드 첫번째로 실행하게 한다.
		
		response.setContentType("application/octet-stream");
		response.setHeader("Content-Disposition", "attachment;filename="+filename);
		response.setHeader("Content-Transfer-Encoding", "binary");
		// 브라우저로 내려보내는 스트림 얻기
		OutputStream os = response.getOutputStream();
		
		FileCopyUtils.copy(fis, os);
	}
}
