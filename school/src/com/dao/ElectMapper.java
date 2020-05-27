package com.dao;

import java.util.List;

import com.vo.Elect;

public interface ElectMapper {
	//--   查询 
	public List<Elect> findElect(Elect elect);
	//--  添加
	public void insertElect(Elect elect);
	//--  修改
	public void updateElect(Elect elect);
	//--  删除
	public void deleteElect(Elect elect);
}
