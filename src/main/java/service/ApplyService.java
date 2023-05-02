package service;

import java.util.List;

import dto.Apply;
import dto.ClassSessionView;

public interface ApplyService {
	
	public int insertApply(Apply obj);
	
	public List<Apply> selectApplyList(String id);
	
	public ClassSessionView selectClassSessionViewOne(long no);

}
