package co.kr.mba.controller;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Locale;
import java.util.Random;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FileUtils;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.MultipartRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.json.MappingJackson2JsonView;




@Controller
@RequestMapping("/file")
public class FileController {

	
	@Autowired
	MappingJackson2JsonView jsonView;
	
	/*@RequestMapping(value = "/imageupload" ,produces = "application/json")
	public ModelAndView imageupload(Locale locale, Model model,HttpServletRequest req,HttpServletResponse resp,MultipartHttpServletRequest multiFile) throws Exception {
		ModelAndView mav = new ModelAndView();
		
		
		
		JSONObject json = new JSONObject();
		PrintWriter printWriter = null;
		OutputStream out = null;
		MultipartFile file = multiFile.getFile("upload");
		System.out.println(file);
		
		
		
		System.out.println("ImageUpload");
		mav.setView(jsonView);
		return mav;
		
		
	}*/
	@RequestMapping(value = "/imageuploadg", method = RequestMethod.GET)
	public void d() {
		System.out.println("이미지 업로더 들어옴");
	}
	@RequestMapping(value = "/imageupload", method = RequestMethod.POST)
	public void communityImageUpload(HttpServletRequest request, HttpServletResponse response, @RequestParam MultipartFile upload) {
		System.out.println("이미지 업로더 들어옴");
	    OutputStream out = null;
	    PrintWriter printWriter = null;
	    response.setCharacterEncoding("utf-8");
	    response.setContentType("text/html;charset=utf-8");
	 
	    try{
	 
	        String fileName = upload.getOriginalFilename();
	        byte[] bytes = upload.getBytes();
	        String uploadPath = "resources/" + fileName;//저장경로
	 
	        out = new FileOutputStream(new File(uploadPath));
	        out.write(bytes);
	        String callback = request.getParameter("CKEditorFuncNum");
	 
	        printWriter = response.getWriter();
	        String fileUrl = "resources/" + fileName;//url경로
	 
	        printWriter.println("<script type='text/javascript'>window.parent.CKEDITOR.tools.callFunction("
	                + callback
	                + ",'"
	                + fileUrl
	                + "','이미지를 업로드 하였습니다.'"
	                + ")</script>");
	        printWriter.flush();
	 
	    }catch(IOException e){
	        e.printStackTrace();
	    } finally {
	        try {
	            if (out != null) {
	                out.close();
	            }
	            if (printWriter != null) {
	                printWriter.close();
	            }
	        } catch (IOException e) {
	            e.printStackTrace();
	        }
	    }
	 
	    return;
	}
	/*
	@RequestMapping(value = "/imageup", method = RequestMethod.POST, produces = "application/json")
	@ResponseBody
	public JsonObject uploadSummernoteImageFile(@RequestParam("file") MultipartFile multipartFile) {
		JsonObject jsonObject = new JsonObject();
		try {
			
		System.out.println("들어옴");
		String fileRoot = "C:\\summernote_image\\";	//저장될 외부 파일 경로
		String originalFileName = multipartFile.getOriginalFilename();	//오리지날 파일명
		String extension = originalFileName.substring(originalFileName.lastIndexOf("."));	//파일 확장자
				
		String savedFileName = UUID.randomUUID() + extension;	//저장될 파일 명
		
		File targetFile = new File(fileRoot + savedFileName);	
	
		
			InputStream fileStream = multipartFile.getInputStream();
			FileUtils.copyInputStreamToFile(fileStream, targetFile);	//파일 저장
			jsonObject.addProperty("url", "/summernoteImage/"+savedFileName);
			jsonObject.addProperty("responseCode", "success");
				
			System.out.println(jsonObject);
			return jsonObject;
		}catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}	
		return jsonObject;
	}
*/
	
	/*@ResponseBody
	@RequestMapping(value = "/imageup", method = RequestMethod.POST)
	public void summer_image(MultipartFile file, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		String file_name = file.getOriginalFilename();
		String server_file_name = fileDBName(file_name, "/resources/file");
		System.out.println("server file : " + server_file_name);
		file.transferTo(new File("/resources/file" + server_file_name));
		out.println("/resources/file"+server_file_name);
		out.close();
	}
	private String fileDBName(String fileName, String saveFolder) {
		Calendar c = Calendar.getInstance();
		int year = c.get(Calendar.YEAR);
		int month = c.get(Calendar.MONTH);
		int date = c.get(Calendar.DATE);

		String homedir = saveFolder + year + "-" + month + "-" + date;
		System.out.println(homedir);
		File path1 = new File(homedir);
		if (!(path1.exists())) {
			path1.mkdir();
		}
		Random r = new Random();
		int random = r.nextInt(100000000);

		int index = fileName.lastIndexOf(".");

		String fileExtension = fileName.substring(index + 1);
		System.out.println("fileExtension = " + fileExtension);

		String refileName = "bbs" + year + month + date + random + "." + fileExtension;
		System.out.println("refileName = " + refileName);

		String fileDBName = "/"+refileName;
		System.out.println("fileDBName = " + fileDBName);

		return fileDBName;
	}*/
	
	
	@ResponseBody
	@RequestMapping(value = "/imageup",produces = "application/json")
	public String uploadSummernoteImageFile(HttpServletRequest request , HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		
		 //파일정보
        String sFileInfo = "";
        //파일명을 받는다 - 일반 원본파일명
        String filename = request.getHeader("file-name");
        //파일 확장자
        String filename_ext = filename.substring(filename.lastIndexOf(".")+1);
        //확장자를소문자로 변경
        filename_ext = filename_ext.toLowerCase();
        //파일 기본경로
        String fileRoot = "C:\\summernote_image\\";	//저장될 외부 파일 경로
        File file = new File(fileRoot);
        if(!file.exists()) {
           file.mkdirs();
        }
        String realFileNm = "";
        SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMddHHmmss");
        String today= formatter.format(new java.util.Date());
        realFileNm = today+UUID.randomUUID().toString() + filename.substring(filename.lastIndexOf("."));
        String rlFileNm = fileRoot + realFileNm;
        ///////////////// 서버에 파일쓰기 /////////////////
        InputStream is = request.getInputStream();
        OutputStream os=new FileOutputStream(rlFileNm);
        int numRead;
        byte b[] = new byte[Integer.parseInt(request.getHeader("file-size"))];
        while((numRead = is.read(b,0,b.length)) != -1){
           os.write(b,0,numRead);
        }
        if(is != null) {
           is.close();
        }


		
		
		/*System.out.println("imageup");
		String fileRoot = "C:\\summernote_image\\";	//저장될 외부 파일 경로
		String originalFileName = multipartFile.getOriginalFilename();	//오리지날 파일명
		String extension = originalFileName.substring(originalFileName.lastIndexOf("."));	//파일 확장자
				
		String savedFileName = UUID.randomUUID() + extension;	//저장될 파일 명
		
		File targetFile = new File(fileRoot + savedFileName);	
		
		try {
			InputStream fileStream = multipartFile.getInputStream();
			FileUtils.copyInputStreamToFile(fileStream, targetFile);	//파일 저장
			mav.addObject("url", "/summernote_image/"+savedFileName);
			mav.addObject("responseCode", "success");
				
		} catch (IOException e) {
			FileUtils.deleteQuietly(targetFile);	//저장된 파일 삭제
			mav.addObject("responseCode", "error");
			e.printStackTrace();
		}*/
        sFileInfo += "&bNewLine=true";
        sFileInfo += "&sFileName="+ filename;;
        sFileInfo += "&sFileURL="+"/summernote_image/"+realFileNm;


		return sFileInfo;
	}
	@RequestMapping(value = "/imageup2")
	public String uploadSummernoteImageFile2(MultipartRequest multipartRequest,@RequestParam("callback")String callback,@RequestParam("callback_func")String callback_func) {
		ModelAndView mav = new ModelAndView();
		System.out.println(multipartRequest.getFile("Filedata").getName());
		System.out.println(multipartRequest.getFile("Filedata").getSize());
		System.out.println(multipartRequest.getFile("Filedata").isEmpty());
		System.out.println(multipartRequest.getFileNames());
		System.out.println(multipartRequest.getFile("Filedata").getOriginalFilename());
		String fileRoot = "C:\\summernote_image\\";	//저장될 외부 파일 경로
		String originalFileName = multipartRequest.getFile("Filedata").getOriginalFilename();	//오리지날 파일명
		String extension = originalFileName.substring(originalFileName.lastIndexOf("."));	//파일 확장자
				
		String savedFileName = UUID.randomUUID() + extension;	// 저장될 파일 명
		
		File targetFile = new File(fileRoot + savedFileName);	
		
		try {
			InputStream fileStream = multipartRequest.getFile("Filedata").getInputStream();
			FileUtils.copyInputStreamToFile(fileStream, targetFile);	//파일 저장
			mav.addObject("url", "/summernote_image/"+savedFileName);
			mav.addObject("responseCode", "success");
				
		} catch (IOException e) {
			FileUtils.deleteQuietly(targetFile);	//저장된 파일 삭제
			mav.addObject("responseCode", "error");
			e.printStackTrace();
		}
		String file_result = "&bNewLine=true&sFileName="+originalFileName +"&sFileURL=/summernote_image/"+savedFileName;
		System.out.println("-------------");
		System.out.println(callback);
		System.out.println(callback_func);
		System.out.println("asdfasdf");
		String urlencode = "";
		try {
			urlencode = URLEncoder.encode(callback_func,"UTF-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "redirect:"+callback + "?callback_func="+ urlencode+file_result;
	}
}
