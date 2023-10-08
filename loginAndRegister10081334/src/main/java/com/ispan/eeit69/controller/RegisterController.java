package com.ispan.eeit69.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.view.RedirectView;

import com.ispan.eeit69.model.BusinessInformationForm;
import com.ispan.eeit69.model.InvitationCodeForm;
import com.ispan.eeit69.dao.impl.BusinessUsersRepository;
import com.ispan.eeit69.dao.impl.InvitationCodeRepository;
import com.ispan.eeit69.model.AjaxObj;
import com.ispan.eeit69.service.Impl.BusinessUserService;

@RestController
public class RegisterController {

	@Autowired
	private BusinessUserService businessUserService;

	@PostMapping(value = "/checkUsername", consumes = MediaType.APPLICATION_JSON_VALUE, produces = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<?> checkUsername(@RequestBody AjaxObj registrationForm) {
		String invitationCode = registrationForm.getInvitationCode();
		String username = registrationForm.getUsername();
		String password = registrationForm.getPassword();
		String password2 = registrationForm.getPassword2();
		
		// 返回响应
		Map<String, Object> response = new HashMap<>();

		System.out.println("邀請碼為" + invitationCode);
		InvitationCodeForm invitationCodeForm = businessUserService.findByInvitationCode(invitationCode);
		if (invitationCodeForm != null) {
			if (password.equals(password2)) {
				String usernameString = businessUserService.findByUsername(username);
				if (usernameString != null) {
					String errorMessage = "使用者名稱已存在，請選擇其他使用者名稱";
					response.put("exists", true);
					response.put("message", errorMessage);
					return ResponseEntity.ok(response);
				} else {
					InvitationCodeForm level =  businessUserService.findByInvitationCode(invitationCode);
					String levelString = level.getLevel();
					 businessUserService.deleteByInvitationCodeAndLevel(invitationCode,levelString);
					String bcryptHashPassword = BCrypt.hashpw(password, BCrypt.gensalt());
					 businessUserService.addUsernameAndPassword(username, bcryptHashPassword);
					businessUserService.updateLevelByUsername(username, levelString);
					response.put("exists", false);
					response.put("redirect", "/registerOk"); // 指定跳轉頁面的路徑
					return ResponseEntity.ok(response);
				}
			} else {
				String errorMessage = "密碼不一致";
				response.put("exists", true);
				response.put("message", errorMessage);
				return ResponseEntity.ok(response);
			}
		} else {
			System.out.println("未找到相應的邀請碼: " + invitationCode);
			String errorMessage = "邀請碼不存在";
			response.put("exists", true);
			response.put("message", errorMessage);
			return ResponseEntity.ok(response);
		}
	}
}
