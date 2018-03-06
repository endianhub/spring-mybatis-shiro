package com.xh.mybatis.shiro.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.xh.mybatis.shiro.dao.IUserDao;
import com.xh.mybatis.shiro.model.User;
import com.xh.mybatis.shiro.service.IUserService;

@Service
public class UserServiceImpl implements IUserService {

	@Autowired
	private IUserDao userDao;

	public List<User> findByLoginName(User user) {
		return userDao.findByLoginName(user);
	}

	public List<User> queryList() {
		List<User> list = userDao.queryList();
		return list;
	}

}
