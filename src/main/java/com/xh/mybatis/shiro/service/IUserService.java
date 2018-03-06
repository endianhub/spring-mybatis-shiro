package com.xh.mybatis.shiro.service;

import java.util.List;

import com.xh.mybatis.shiro.model.User;

public interface IUserService{

	List<User> findByLoginName(User user);
	
	List<User> queryList();
	
}
