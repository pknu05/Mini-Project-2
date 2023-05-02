package service;

import java.util.List;

import dto.ClassSessionView;
import dto.Classproduct;
import dto.Session;

public interface ClassProductService {
	
	public List<ClassSessionView> selectClassSessionView(long classcode);
	
	public Session selectSessionOne(long sessionno);
	
	public Classproduct selectClassproductOne(long classcode);

}
