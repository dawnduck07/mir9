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
	//폼메일관리 4가지로 분류 폼메일, 문항관리, 폼메일게시글
	public String formProcess(Map<String, Object> map) throws Exception{
		Form form = (Form) map.get("form");
		
		//폼메일
		if("form".equals(map.get("part"))) {
			//폼메일 등록
			if("insert".equals(map.get("mode"))) {
				formDao.addForm(form);
			//폼메일 수정
			}else if("update".equals(map.get("mode"))) {
				formDao.updateForm(form);
			//폼메일 선택삭제
			}else if("delete".equals(map.get("mode"))) {
				List<Integer> formArr = (List<Integer>) map.get("formArr");
				formDao.deleteChoiceForm(formArr);
			//폼메일 복제
			}else if("copy".equals(map.get("mode"))) {
				List<String> formArr = (List<String>) map.get("formArr");
				for(String i : formArr) {
					Form copyForm = formDao.getForm(Integer.parseInt(i));
					formDao.addForm(copyForm);
				}
			}
			return "redirect:/admin/form/list";
		
		//문항관리
		}else if("item".equals(map.get("part"))) {
			Item item = (Item) map.get("item");
			
			//문항 등록
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
			//문항 수정
			}else if("update".equals(map.get("mode"))) {
				if(!"select".equals(item.getInput_type()) && !"checkbox".equals(item.getInput_type()) && !"radio".equals(item.getInput_type())) {
					item.setInput_example("");
				}
				formDao.updateItem(item);
				return "redirect:/admin/form/itemList?formNo="+form.getFormNo();
			//문항 삭제
			}else if("delete".equals(map.get("mode"))) {
				List<Integer> formArr = (List<Integer>) map.get("formArr");
				formDao.deleteChoiceItem(formArr);
			//htmlDsignList 수정
			}else if("updateDesignList".equals(map.get("mode"))) {
				formDao.updateFormDesignList(form);
				return "redirect:/admin/form/itemList?formNo="+form.getFormNo();
			//htmlDsignWrite 수정				
			}else if("updateDesignWrite".equals(map.get("mode"))) {
				formDao.updateFormDesignWrite(form);
				return "redirect:/admin/form/itemList?formNo="+form.getFormNo();
			}
			
		//폼메일 게시글
		}else if("formPost".equals(map.get("part"))) {
			FormPost formPost = (FormPost) map.get("formPost");
			
			//폼메일 게시글 등록, 수정
			//view에 있는 각 데이터를 배열로 받아온 뒤 StringBuffer를 이용하여 for문으로 하나씩 받아와 append 해주는 방식이다.
			//그렇게 append 되어진 데이터는 A&B&C&D.. 형식으로 데이터를 저장하게 된다.
			//해당 데이터를 리스트로 뽑아오기 위해서는 &을 기준으로 split을 이용하여 배열에 담은 뒤 출력한다.
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
				
			//폼메일 게시글 선택삭제
			}else if("delete".equals(map.get("mode"))) {
				List<Integer> formArr = (List<Integer>) map.get("formArr");
				formDao.deleteChoiceFormPost(formArr);
			}
		}
		
		return null;
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
