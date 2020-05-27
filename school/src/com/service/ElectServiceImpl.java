package com.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.ElectMapper;
import com.service_interface.ElectService;
import com.vo.Elect;
@Service
public class ElectServiceImpl implements ElectService{

	@Autowired
	private ElectMapper electMapper;
	@Override
	public List<Elect> findElect(Elect elect){
		return electMapper.findElect(elect);
	}
	@Override
	public void insertElect(Elect elect){
		electMapper.insertElect(elect);
	}
	@Override
	public void updateElect(Elect elect){
		electMapper.updateElect(elect);
	}
	@Override
	public void deleteElect(Elect elect){
		electMapper.deleteElect(elect);
	}
	
	
	
	
	
	
	
	
	
	@Override
	public List<Elect> findTC(Elect elect){
		return electMapper.findElect(elect);
	}
}
