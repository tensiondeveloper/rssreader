package co.kr.mba.controller;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.security.Principal;
import java.util.HashMap;
import java.util.Locale;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.json.MappingJackson2JsonView;

import co.kr.mba.service.Adminservice;
import co.kr.mba.service.Apiservice;
import co.kr.mba.service.Boardservice;

@Controller
@RequestMapping("/admint")
public class AdminController {
	@Autowired
	Apiservice service;
	@Autowired
	Boardservice boardService;
	@Autowired
	Adminservice adminService;
	@Autowired
	MappingJackson2JsonView jsonView;

	public int pages = 20;

	private FileDownloadView downloadView; // 파일 다운로드 뷰 1

	@Autowired
	public void setDownloadView(FileDownloadView view) {
		downloadView = view;
	}

	private String saveFile(MultipartFile file, HttpSession session) {
		// 파일 이름 변경
		UUID uuid = UUID.randomUUID();
		String saveName = uuid + "_" + file.getOriginalFilename();
		String defaultPath = session.getServletContext().getRealPath("/");
		String fileRoot = "C:\\groupimg\\";
		// 저장할 File 객체를 생성(껍데기 파일)ㄴ
		File saveFile = new File(fileRoot, saveName); // 저장할 폴더 이름, 저장할 파일 이름

		try {
			file.transferTo(saveFile); // 업로드 파일에 saveFile이라는 껍데기 입힘
		} catch (IOException e) {
			e.printStackTrace();
			return null;
		}

		return saveName;
	}

	public String donaimgsave(MultipartFile file) {
		String fileRoot = "C:\\groupimg\\"; // 저장될 외부 파일 경로
		String originalFileName = file.getOriginalFilename(); // 오리지날 파일명
		String orifilenameonly = originalFileName.substring(0, originalFileName.lastIndexOf("."));
		String extension = originalFileName.substring(originalFileName.lastIndexOf(".")); // 파일 확장자
		String savedFileName = orifilenameonly + "_" + UUID.randomUUID().toString().substring(0, 5) + extension; // 저장될
																													// 파일
																													// 명
		File targetFile = new File(fileRoot + savedFileName);
		try {
			InputStream fileStream = file.getInputStream();
			FileUtils.copyInputStreamToFile(fileStream, targetFile); // 파일 저장
		} catch (IOException e) {
			FileUtils.deleteQuietly(targetFile); // 저장된 파일 삭제
			e.printStackTrace();
		}
		return savedFileName;
	}

}
