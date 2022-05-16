package com.naedam.admin.form.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.naedam.admin.form.model.vo.Form;
import com.naedam.admin.form.model.vo.FormPost;
import com.naedam.admin.form.model.vo.Item;

@Repository
public class FormDaoImpl implements FormDao {
	@Autowired
	private SqlSession session;

	//폼메일 등록
	@Override
	public int addForm(Form form) throws Exception {
		// TODO Auto-generated method stub
		return session.insert("form.addForm", form);
	}
	
	//폼메일 게시글 등록
	@Override
	public int addFormPost(FormPost formPost) throws Exception {
		// TODO Auto-generated method stub
		return session.insert("form.addFormPost", formPost);
	}
	
	//문항 등록
	@Override
	public int addItem(Item item) throws Exception {
		// TODO Auto-generated method stub
		return session.insert("form.addItem", item);
	}	
	
	//폼메일 리스트
	@Override
	public List<Form> formList() throws Exception {
		// TODO Auto-generated method stub
		return session.selectList("form.formList");
	}
	
	//폼메일 게시글 리스트
	@Override
	public List<FormPost> formPostList(int formNo) throws Exception {
		// TODO Auto-generated method stub
		return session.selectList("form.formPostList", formNo);
	}
	
	//문항관리 리스트
	@Override
	public List<Item> itemList(int formNo) throws Exception {
		// TODO Auto-generated method stub
		return session.selectList("form.itemList", formNo);
	}

	//폼메일 정보
	@Override
	public Form getForm(int code) throws Exception {
		// TODO Auto-generated method stub
		return session.selectOne("form.getForm", code);
	}
	
	//문항 정보
	@Override
	public Item getItem(int itemNo) throws Exception {
		// TODO Auto-generated method stub
		return session.selectOne("form.getItem", itemNo);
	}
	
	//폼메일 선택삭제
	@Override
	public void deleteChoiceForm(int formNo) throws Exception {
		// TODO Auto-generated method stub
		session.delete("form.deleteChoiceForm", formNo);
	}
	
	//문항 선택삭제
	@Override
	public void deleteChoiceItem(int itemNo) throws Exception {
		// TODO Auto-generated method stub
		session.delete("form.deleteChoiceItem", itemNo);
	}
	
	//폼메일 수정
	@Override
	public int updateForm(Form form) throws Exception {
		// TODO Auto-generated method stub
		return session.update("form.updateForm", form);
	}
	
	//문항 수정
	@Override
	public int updateItem(Item item) throws Exception {
		// TODO Auto-generated method stub
		return session.update("form.updateItem", item);
	}
	
	//폼 디자인 수정
	@Override
	public int updateFormDesign(Form form) throws Exception {
		// TODO Auto-generated method stub
		return session.update("form.updateFormDesign", form);
	}

}
