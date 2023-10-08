package com.ispan.eeit69.service.Impl;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ispan.eeit69.dao.impl.BusinessUsersRepository;
import com.ispan.eeit69.dao.impl.InvitationCodeRepository;
import com.ispan.eeit69.model.BusinessInformationForm;
import com.ispan.eeit69.model.InvitationCodeForm;

@Service
public class BusinessUserService {
    @Autowired
    private BusinessUsersRepository businessUsersRepository;
    @Autowired
    private InvitationCodeRepository invitationCodeRepository;
    
    public InvitationCodeForm findByInvitationCode(String invitationCode) {
    InvitationCodeForm invitationCodeForm = invitationCodeRepository.findByInvitationCode(invitationCode);
    return invitationCodeForm;
    }

    public String findLevelByInvitationCode(String invitationCode) {
    	String invitationCodeForm = invitationCodeRepository.findLevelByInvitationCode(invitationCode);
    	 if (invitationCodeForm != null) {
         	System.out.println("找到的邀請碼為: " + invitationCode);
             return invitationCodeForm;
         } else {
             return null;  // 或者返回"没有找到"，根据你的需求
         }
    }
    
    public void deleteByInvitationCodeAndLevel(String invitationCode, String level) {
    	invitationCodeRepository.deleteByInvitationCodeAndLevel(invitationCode,level);
    }
    

    public String findByUsername(String username) {
        BusinessInformationForm user = businessUsersRepository.findByUsername(username);
        if (user != null) {
        	System.out.println("使用者為: " + username);
            return user.getUsername();
        } else {
            return null;  // 或者返回"没有找到"，根据你的需求
        }
    }
    
    public Map<String, Object> getBusinessInformation(String username) {
        return businessUsersRepository.findBusinessInfoByUsername(username);
    }
    
    @Transactional
    public void updateBusinessInfo(String username, String newStoreName, String newStoreAddress, String newContactPerson, String newPhoneNum) {
    	  BusinessInformationForm user = businessUsersRepository.findByUsername(username);
          if (user != null) {
              user.setStoreName(newStoreName);
              user.setStoreAddress(newStoreAddress);
              user.setContactPerson(newContactPerson);
              user.setPhoneNum(newPhoneNum);
              businessUsersRepository.save(user);
              System.out.println("更新商戶信息：用戶名稱 " + username);
          }else{
          	System.out.println("商戶信息不存在");
          }
    }
    
    @Transactional
    public void updatePasswordByUsername(String username, String newPassword) {
        BusinessInformationForm user = businessUsersRepository.findByUsername(username);
        if (user != null) {
            user.setPassword(newPassword);
            businessUsersRepository.save(user);
        }
    }
    
    public String findPasswordByUsername(String username) {
        String password = businessUsersRepository.findPasswordByUsername(username);
        if (password != null) {
            System.out.println("找到的密碼是: " + password);
            return password;
        } else {
            System.out.println("沒有找到與該 username 相關的密碼");
            return null;
        }
 	}
    
    @Transactional
    public void addUsernameAndPassword(String username, String password) {
    	BusinessInformationForm businessInformationForm = new BusinessInformationForm();
		businessInformationForm.setUsername(username);
		businessInformationForm.setPassword(password);
		businessUsersRepository.save(businessInformationForm);
		System.out.println("增帳號" + username + "新增密碼" + password);
    }
    
    @Transactional
    public void updateLevelByUsername(String username, String newLevel) {
    	businessUsersRepository.addLevelByUsername(username, newLevel);
    }
 	
    public String findLevelByUsername(String username) {
        String level = businessUsersRepository.findLevelByUsername(username);
        if (level != null) {
            System.out.println("找到的 level 是: " + level);
            return level;
        } else {
            System.out.println("沒有找到與該 username 相關的 level");
            return null;
        }
    }

    
    
}