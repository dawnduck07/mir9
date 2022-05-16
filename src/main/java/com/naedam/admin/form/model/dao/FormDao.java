package com.naedam.admin.form.model.dao;

import java.util.List;

import com.naedam.admin.form.model.vo.Form;
import com.naedam.admin.form.model.vo.FormPost;
import com.naedam.admin.form.model.vo.Item;

public interface FormDao {
	
	//폼메일 등록
	public int addForm(Form form) throws Exception;
	
	//폼메일 게시글 등록
	public int addFormPost(FormPost formPost) throws Exception;
	
	//문항 등록
	public int addItem(Item item) throws Exception;
	
	//폼메일 리스트
	public List<Form> formList() throws Exception;
	
	//폼메일 게시글 리스트
	public List<FormPost> formPostList(int formNo) throws Exception;
	
	//문항관리 리스트
	public List<Item> itemList(int formNo) throws Exception;
	
	//폼메일 정보
	public Form getForm(int formNo) throws Exception;
	
	//문항 정보
	public Item getItem(int itemNo) throws Exception;
	
	//폼메일 선택삭제
	public void deleteChoiceForm(int code) throws Exception;
	
	//문항 선택삭제
	public void deleteChoiceItem(int itemNo) throws Exception;
	
	//폼메일 수정
	public int updateForm(Form form) throws Exception;
	
	//문항 수정
	public int updateItem(Item item) throws Exception;
	
	//폼 디자인 수정
	public int updateFormDesign(Form form) throws Exception;
}
