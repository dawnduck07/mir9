package com.naedam.admin.form.model.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.naedam.admin.form.model.dao.FormDao;
import com.naedam.admin.form.model.vo.Form;
import com.naedam.admin.form.model.vo.FormPost;
import com.naedam.admin.form.model.vo.Item;
import com.naedam.admin.form.model.vo.ItemChoice;

@Service
public class FormServiceImpl implements FormService {
	@Autowired
	private FormDao formDao;
	
	//폼메일관리 프로세서
	public String formProcess(Map<String, Object> map) throws Exception{
		Form form = (Form) map.get("form");
		if("form".equals(map.get("part"))) {
			if("insert".equals(map.get("mode"))) {
				formDao.addForm(form);
			}else if("update".equals(map.get("mode"))) {
				formDao.updateForm(form);
			}else if("delete".equals(map.get("mode"))) {
				List<String> formArr = (List<String>) map.get("formArr");
				for(String i : formArr) {
					formDao.deleteChoiceForm(Integer.parseInt(i));
				}
			}else if("copy".equals(map.get("mode"))) {
				List<String> formArr = (List<String>) map.get("formArr");
				for(String i : formArr) {
					Form copyForm = formDao.getForm(Integer.parseInt(i));
					formDao.addForm(copyForm);
				}
			}
			return "redirect:/admin/form/list";
		}else if("item".equals(map.get("part"))) {
			Item item = (Item) map.get("item");
			if("insert".equals(map.get("mode"))) {
				item.setForm(form);
				formDao.addItem(item);
				if(item.getInput_example() != null) {
					ItemChoice ic = new ItemChoice();
					ic.setItem(item);
					String[] exampleArr = item.getInput_example().split("\r\n"); 
					for(int i = 0; i < exampleArr.length; i++) {
						ic.setName(exampleArr[i]);
						formDao.addItemChoice(ic);
					}
				}
				return "redirect:/admin/form/itemList?formNo="+form.getFormNo();
			}else if("update".equals(map.get("mode"))) {
				if(!"select".equals(item.getInput_type()) && !"checkbox".equals(item.getInput_type()) && !"radio".equals(item.getInput_type())) {
					item.setInput_example("");
				}
				formDao.updateItem(item);
				return "redirect:/admin/form/itemList?formNo="+form.getFormNo();
			}else if("delete".equals(map.get("mode"))) {
				List<String> formArr = (List<String>) map.get("formArr");
				for(String i : formArr) {
					formDao.deleteChoiceItem(Integer.parseInt(i));
				}
			}else if("updateDesignList".equals(map.get("mode"))) {
				formDao.updateFormDesignList(form);
				return "redirect:/admin/form/itemList?formNo="+form.getFormNo();
			}else if("updateDesignWrite".equals(map.get("mode"))) {
				formDao.updateFormDesignWrite(form);
				return "redirect:/admin/form/itemList?formNo="+form.getFormNo();
			}
			
		}else if("formPost".equals(map.get("part"))) {
			FormPost formPost = (FormPost) map.get("formPost");
			if("insert".equals(map.get("mode")) || "update".equals(map.get("mode"))) {
				FormPost sbFormPost = new FormPost();
				StringBuffer sb = new StringBuffer();
				StringBuffer sb2 = new StringBuffer();
				StringBuffer sb3 = new StringBuffer();
				List<String> formArr = (List<String>) map.get("formArr");
				List<Item> trList = formDao.formTr(form.getFormNo());
				for(int i = 0; i < trList.size(); i++) {
					String data = formArr.get(i);
					String data2 = Integer.toString(trList.get(i).getItemNo());
					String data3 = trList.get(i).getInput_type();
					if(i == 0) {
						sb2.append(data2);
						sb3.append(data3);
						if("".equals(data)) {
							sb.append(" ");
						}else {
							sb.append(data);
						}
					}else if(i != 0) {
						sb2.append("&"+data2);
						sb3.append("&"+data3);
						if("".equals(data)) {
							sb.append("& ");
						}else {
							sb.append("&"+data);
						}
					}
					sbFormPost.setItemData(sb.toString());
					sbFormPost.setItemNo(sb2.toString());
					sbFormPost.setItemInput(sb3.toString());
					sbFormPost.setForm(form);	
				}
				if("insert".equals(map.get("mode"))) {
					formDao.addFormPost(sbFormPost);
				}else if("update".equals(map.get("mode"))) {
					formDao.updateFormPost(sbFormPost);
				}
				return "redirect:/admin/form/formPostList?formNo="+form.getFormNo();
			}else if("delete".equals(map.get("mode"))) {
				List<String> formArr = (List<String>) map.get("formArr");
				for(String i : formArr) {
					formDao.deleteChoiceFormPost(Integer.parseInt(i));
				}
			}
		}
		
		return "";
	}
	
	//문항 예시 등록
	@Override
	public int addItemChoice(ItemChoice itemChoice) throws Exception {
		// TODO Auto-generated method stub
		return formDao.addItemChoice(itemChoice);
	}
	
	//폼메일 리스트
	@Override
	public List<Form> formList() throws Exception {
		// TODO Auto-generated method stub
		return formDao.formList();
	}

	//폼메일 리스트 카운트
	@Override
	public int formListCount() throws Exception {
		// TODO Auto-generated method stub
		return formDao.formListCount();
	}
	
	//문항관리 리스트
	@Override
	public List<Item> itemList(int formNo) throws Exception {
		// TODO Auto-generated method stub
		return formDao.itemList(formNo);
	}

	//문항관리 리스트 카운트
	@Override
	public int itemListCount(int formNo) throws Exception {
		// TODO Auto-generated method stub
		return formDao.itemListCount(formNo);
	}	
	
	//폼게시물 리스트
	@Override
	public List<FormPost> formPostList(int formNo, int offset, int limit) throws Exception {
		// TODO Auto-generated method stub
		return formDao.formPostList(formNo,offset,limit);
	}
	
	//폼게시물 리스트
	@Override
	public List<FormPost> formPostList2(int formNo) throws Exception {
		// TODO Auto-generated method stub
		return formDao.formPostList2(formNo);
	}	
	
	//폼게시물 카운트
	@Override
	public int formPostListCount(int code) throws Exception {
		// TODO Auto-generated method stub
		return formDao.formPostListCount(code);
	}
	
	//폼메일 정보
	@Override
	public Form getForm(int code) throws Exception {
		// TODO Auto-generated method stub
		return formDao.getForm(code);
	}

	//문항 정보
	@Override
	public Item getItem(int itemNo) throws Exception {
		// TODO Auto-generated method stub
		return formDao.getItem(itemNo);
	}
	
	//폼 게시물 정보
	@Override
	public FormPost getFormPost(int code) throws Exception {
		// TODO Auto-generated method stub
		return formDao.getFormPost(code);
	}
	
	//예시 정보
	@Override
	public List<ItemChoice> getItemChoice(int itemNo) throws Exception {
		// TODO Auto-generated method stub
		return formDao.getItemChoice(itemNo);
	}
	
	//문항 td
	@Override
	public List<Item> formTd(int formNo) throws Exception {
		// TODO Auto-generated method stub
		return formDao.formTd(formNo);
	}
	
	//문항 tr
	@Override
	public List<Item> formTr(int formNo) throws Exception {
		// TODO Auto-generated method stub
		return formDao.formTr(formNo);
	}

	//item down순서변경
	@Override
	public void updateDownAsc(Map<String, Object> map) throws Exception {
		formDao.updateDownAsc(map);
	}

	//item up순서변경
	@Override
	public void updateUpAsc(Map<String, Object> map) throws Exception {
		formDao.updateUpAsc(map);
	}
	
	//formPost down순서변경
	@Override
	public void updateDownAsc2(Map<String, Object> map) throws Exception {
		formDao.updateDownAsc2(map);
	}

	//formPost up순서변경
	@Override
	public void updateUpAsc2(Map<String, Object> map) throws Exception {
		formDao.updateUpAsc2(map);
	}

}
