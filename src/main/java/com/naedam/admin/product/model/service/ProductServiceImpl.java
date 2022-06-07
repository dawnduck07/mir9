package com.naedam.admin.product.model.service;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.naedam.admin.category.model.dao.CategoryDao;
import com.naedam.admin.category.model.vo.Category;
import com.naedam.admin.option.model.vo.ProductOptionDetail;
import com.naedam.admin.product.model.dao.ProductDao;
import com.naedam.admin.product.model.vo.Product;
import com.naedam.admin.product.model.vo.ProductDetail;
import com.naedam.admin.product.model.vo.ProductDiscription;
import com.naedam.admin.product.model.vo.ProductExcelForm;
import com.naedam.admin.product.model.vo.ProductImg;

@Service
public class ProductServiceImpl implements ProductService{
	@Autowired
	private ProductDao productDao;
	@Autowired
	private CategoryDao categoryDao;

	@Override
	public List<ProductDetail> selectAllProductList() {
		return productDao.selectAllProductList();
	}

	@Override
	public List<ProductExcelForm> selectProductExcelForm() {
		return productDao.selectProductExcelForm();
	}

	@Override
	public List<ProductDetail> selectProductListByCteNo(String cteNo) {
		return productDao.selectProductListByCteNo(cteNo);
	}

	@Override
	public int updateProductImg(ProductImg img) {
		return productDao.updateProductImg(img);
	}

	@Override
	public int updateProductDiscription(ProductDiscription pd) {
		return productDao.updateProductDiscription(pd);
	}

	@Override
	public int insertProductImg(ProductImg img) {
		return productDao.insertProductImg(img);
	}

	@Override
	public int insertProductDiscription(ProductDiscription pd) {
		return productDao.insertProductDiscription(pd);
	}

	@Override
	public Map<String, Object> listSub(Map<String, String> param) {
		int level = 0;
		String cteNo = param.get("cteNo");
		List<ProductDetail> productList = productDao.selectProductListByParam(param);
		int productListCnt = productList.size();
		/*
		 * if(cteNo.equals("0")) { productList = productDao.selectAllProductList();
		 * }else { productList = productDao.selectProductListByCteNo(cteNo); }
		*/
		try {
			level = categoryDao.selectCategoryLevel(cteNo);
		} catch (Exception e) {}
		List<Category> cteList = categoryDao.selectRelatedCtegoryByCteNo(cteNo);
		
		Map<String, Object> map = new HashMap<>();
		map.put("productList", productList);
		map.put("productListCnt", productListCnt);
		map.put("level", level);
		map.put("cteList", cteList);
		return map;
	}

	@Override
	public String treeModel(String stp, HttpServletRequest request) {
		StringBuilder sb = new StringBuilder();
		  
		String type = "";
		StringBuffer url = request.getRequestURL();
		url.delete(url.indexOf("/tree"), url.indexOf("/tree")+11);
		  
		if(stp.equals("pc")) {
			type = "product";
			url.append("/productCategory_sub?cteNo=");
		}else if(stp.equals("pl")) {
			type = "product";
			url.append("/list_sub?cteNo=");
		}
		  
		List<Category> categoryList = categoryDao.selectProductCategory(type);
		Boolean flag = false;
		sb.append("['Home', '" + url + "'\n");
		  
		for(Category c1 : categoryList) {
			if(c1.getLevel() == 1) {
				sb.append(",['"+ c1.getCategoryName() + "','"+ url + c1.getCategoryNo() +"'" );
				for(Category c2 : categoryList) {
					if(c2.getLevel() == 2) {
						if(c1.getCategoryNo() == c2.getParentNo()) {
							sb.append(",\n\t['"+ c2.getCategoryName() + "','"+ url + c2.getCategoryNo() +"'");
							for(Category c3 : categoryList) {
								if(c3.getLevel() == 3) {
									if(c2.getCategoryNo() == c3.getParentNo()) {
										sb.append("\n\t\t,['"+ c3.getCategoryName() + "','"+ url + c3.getCategoryNo() +"&']" );
									}
								}
							}
							sb.append(",]\n");
							flag = true;
						}else {
							sb.append("]");
							flag = false;
							break;
						}
					}
				}
				if(flag) {
					sb.append(",]");               
				}
			}
		}
		sb.append(",]");
		
		String result = sb.toString();
		return result;
	}

	@Override
	public int productDelete(HttpServletRequest request) {
		int result = 0;
		List<String> productrNoList =  Arrays.asList(request.getParameterValues("list[]"));
		for(String productNo : productrNoList) {
			result = productDao.deleteProductByProductNo(productNo);
		}
		return result;
	}

	@Override
	public List<Object> fillForm(String productNo) {
		List<Object> productInfo = new ArrayList<Object>();
		Product product = productDao.selectOneProductByProductNo(productNo);
		List<ProductImg> productImgs = productDao.selectProductImgsByProductNo(productNo);
		List<ProductOptionDetail> option = productDao.selectProductOptionDetailByOptionNo(product.getOptionNo());
		List<ProductDiscription> discriptions = productDao.selectProductDiscriptionByProductNo(productNo);
		
		productInfo.add(product);
		productInfo.add(productImgs);
		productInfo.add(option);
		productInfo.add(discriptions);
		return productInfo;
	}

	@Override
	public Map<String, Object> productCategorySub(int cteNo) {
		List<Category> cteList = new ArrayList<Category>();
		List<Category> relatedCteList = categoryDao.selectRelatedCtegoryByCteNo(Integer.toString(cteNo));
		if(cteNo == 0) {
			cteList = categoryDao.selectProductCategoryByLevel(1);
	    }else {
	        cteList = categoryDao.selectProductCategoryChildByParentNo(cteNo);
	    }		
		
		Map<String, Object> map = new HashMap<>();
		map.put("cteList", cteList);
		map.put("relatedCteList", relatedCteList);
		return map;
	}

	@Override
	public int copyProduct(HttpServletRequest request) {
		Product product = productDao.selectOneProductByProductNo(request.getParameter("code"));
	    product.setLangType(request.getParameter("product_locale"));
	    int result = productDao.insertProduct(product);
	    
	    int oldProductNo = product.getProductNo();
	    List<ProductImg> imgList = productDao.selectProductImgsByProductNo(Integer.toString(oldProductNo));
	    
	    int newProductNo = product.getProductNo();  
	    for(ProductImg img : imgList) {
	       img.setProductNo(newProductNo);
	       result = productDao.insertProductImg(img);
	    }
		return result;
	}

	@Override
	public int insertProduct(HttpServletRequest request) {
		Product product = setProduct(request);
		int result = productDao.insertProduct(product);
		
		ProductDiscription brief = setDiscription("brief", product, request);
	    ProductDiscription content = setDiscription("content", product, request);
	    List<String> urlList = Arrays.asList(request.getParameterValues("url_file"));
	      
	    for(int i = 0; i < urlList.size(); i++) {
	       ProductImg img = new ProductImg();
	         
	       try {
	          img.setProductNo(product.getProductNo());
	          img.setImgLevel(i+1);
	          img.setImgUrl(urlList.get(i));
	       } catch (Exception e) {}
	         
	       if(img.getImgUrl() != null) {
	          result = productDao.insertProductImg(img);
	       }
	    }
	      
	    result = productDao.insertProductDiscription(brief);
	    result = productDao.insertProductDiscription(content);
	    
	    return result;
	}
	
	@Override
	public int updateProduct(HttpServletRequest request) {
   		Product product = setProduct(request);
		int result = productDao.updateProduct(product);
		
		List<String> imgNoList = Arrays.asList(request.getParameterValues("no_file"));
	    List<String> urlList = Arrays.asList(request.getParameterValues("url_file"));
	      
        for(int i = 0; i < urlList.size(); i++) {
        	ProductImg img = new ProductImg();
         
        	try {
        		img.setProductImgNo(Integer.parseInt(imgNoList.get(i)));
        		img.setImgLevel(i+1);
        		img.setImgUrl(urlList.get(i));
        	} catch (Exception e) {}
         
        	if(img.getImgUrl() != null) {
        		result = productDao.updateProductImg(img);
        	}
        }
	      
	    ProductDiscription brief = setDiscription("brief", product, request);
	    ProductDiscription content = setDiscription("content", product, request);
	      
	    result = productDao.updateProductDiscription(brief);
	    result = productDao.updateProductDiscription(content);
	    
		return result;
	}
	
	private ProductDiscription setDiscription(String type, Product product ,HttpServletRequest request) {
		ProductDiscription pd = new ProductDiscription();
	    switch(type) {
	    	case "brief" :   
		        pd.setDiscriptionLevel(1);
		        pd.setContent(request.getParameter("brief"));
		        pd.setProductNo(product.getProductNo());
		        break;
	         
	        case "content" :
		        pd.setDiscriptionLevel(2);
		        pd.setContent(request.getParameter("content"));
		        pd.setProductNo(product.getProductNo());
		        break;
	    }       
	     return pd;
	}
	
	private Product setProduct(HttpServletRequest request) {
		Product product = new Product();
	    product.setProductNo(Integer.parseInt(request.getParameter("product_no")));
	    product.setCategoryNo(Integer.valueOf(request.getParameter("category_select_box_2")));
	    product.setOptionNo(Integer.parseInt(request.getParameter("option_no")));
	    product.setIndividualPoint(Integer.parseInt(request.getParameter("point")));
	    product.setLangType(request.getParameter("locale"));
	    product.setListTitle(request.getParameter("list_title"));
	    product.setModelName(request.getParameter("model"));
	    product.setProductName(request.getParameter("title"));
	    product.setRetailPrice(Integer.parseInt(request.getParameter("consumer_price").replace(",", "")));
	    product.setSalePrice(Integer.parseInt(request.getParameter("sale_price").replace(",", "")));
	    product.setStatus(request.getParameter("status"));
	    product.setIsSoldOut(request.getParameter("is_sold_out"));
	    product.setProductBest(request.getParameter("is_best"));
	    product.setProductNew(request.getParameter("is_new"));
	    product.setProductEvent(request.getParameter("is_event"));
	      
	    if(product.getIsSoldOut() == null) product.setIsSoldOut("N");
	    if(product.getProductBest() == null) product.setProductBest("N");
	    if(product.getProductNew() == null) product.setProductNew("N");
	    if(product.getProductEvent() == null) product.setProductEvent("N");
	      
	    return product;
	}	
}
