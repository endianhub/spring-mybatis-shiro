package com.xh.mybatis.shiro.dao;

import java.util.List;

import com.xh.mybatis.shiro.model.User;

public interface IUserDao{
	
	List<User> findByLoginName(User user);

	List<User> queryList();
}
