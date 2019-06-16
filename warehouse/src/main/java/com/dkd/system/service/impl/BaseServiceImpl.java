package com.dkd.system.service.impl;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStreamWriter;
import java.lang.reflect.Method;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;
import javax.xml.transform.OutputKeys;
import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerConfigurationException;
import javax.xml.transform.TransformerException;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.dom.DOMSource;
import javax.xml.transform.stream.StreamResult;

import org.apache.commons.io.output.ByteArrayOutputStream;
import org.apache.commons.lang.StringUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.w3c.dom.Document;

import com.dkd.system.dao.BaseDao;
import com.dkd.system.service.IBaseService;
import com.dkd.utils.bean.BeanUtils;
import com.dkd.utils.page.CurrencyPage;
import com.dkd.utils.page.PageUtil;
import com.dkd.utils.uuid.UUIDGenerator;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

/**
 * 泛型Service实现
 * @author SY
 * @param <T> 实体
 * 
 */

@Service
@Transactional
public abstract class BaseServiceImpl<T> implements IBaseService<T> {
	
	public Log log = LogFactory.getLog(this.getClass());
	
	public abstract BaseDao<T> getDao();
	
	public String getDefaultSqlNamespace() {
		Class<?> genericClass = BeanUtils.getGenericClass(this.getClass());
		return genericClass == null ? null : genericClass.getSimpleName();
	}
    
	/**
	 * 通用插入实体对象
	 * @param t
	 * @return
	 */
	
    @Override
	public int insert(T t) {  
    	return getDao().insert(t);
    }  
    
    /**
     * 通用修改实体
     * @param t
     * @return
     */
    
    @Override
	public int update(T t) {  
        return getDao().update(t);  
    }  
    
    /**
     * 通用编辑实体
     * @param t
     * @param primaryKey
     */
    
    @Override
	public void edit(T t, String primaryKey) {
    	if(StringUtils.isEmpty(primaryKey)){
    		try {
    			BeanUtils.invokeSet(t, getDefaultSqlNamespace().toLowerCase()+"_id", UUIDGenerator.getUUID());
    		} catch (Exception e) {
				e.printStackTrace();
				log.error(e.toString());
			}
    		getDao().insert(t);
		}else{
			getDao().update(t);
		}
    }
    
  
    
    /**
     * 通用删除实体 物理删除
     * @param primaryKey
     * @return
     */
    
    @Override
	public int delete(String primaryKey) {  
        return getDao().delete(primaryKey);  
    } 
    
    /**
     * 通用条件查询
     * @param object 
     * @return
     */
    
    @Override
	public Map<String, Object> selectByCondition(Object object) {
		try {
			Map<String, Object> map = new HashMap<String, Object>();
			PageUtil pageUtil = new PageUtil();
			map.put(object.getClass().getSimpleName(), object);
			int totalCount = getDao().countByCondition(map);
			Method getPageNow;
			getPageNow = object.getClass().getMethod("getPageNow");
			Method getPageSize;
			getPageSize = object.getClass().getMethod("getPageSize");
			Object pageNow = getPageNow.invoke(object);
			Object pageSize = getPageSize.invoke(object);
			map.put("page", pageUtil.getPage((String) pageNow, totalCount,(String) pageSize));
			List<T> list = getDao().selectByCondition(map);
			map.put("list", list);
			return map;
		} catch (Exception e) {
			e.printStackTrace();
			log.error(e.toString());
			return null;
		} 
	}
    
    /**
     * 通用条件查询分页
     */
    public CurrencyPage<T> queryPage(CurrencyPage<T> page) {
		PageHelper.startPage(page.getPageNum(), page.getPageSize());
		List<T> list = getDao().selectByCondition(page.getQueryTerms());
		PageInfo<T> pageInfo = new PageInfo<T>(list);
		page.setPageInfo(pageInfo);
		return page;
	}

	/**
     * 通用的id查询实体
     * @param primaryKey
     * @return
     */
    
	@Override
	public T selectByPk(String primaryKey) {  
        return getDao().selectByPk(primaryKey);
    }
	
	/**
	 * 通用查询全部
	 * @return
	 */
	
    @Override
	public List<T> selectAll() {
    	return getDao().selectAll();
	}
	
    /**
     * 通用统计全部
     * @return
     */
    
	@Override
	public int countAll() { 
		 return getDao().countAll();
	}
	
	/**
	 * 通用条件统计
	 * @param object
	 * @return
	 */
	
	@Override
	public int countByCondition(Object object) { 
		return getDao().countByCondition(object);
	} 
    
	/**
	 * 打印预览
	 * @param fileName
	 * @param outPutFile
	 * @param map
	 * @throws TransformerException
	 * @throws IOException
	 * @throws ParserConfigurationException
	 */
	
	/*@Override
	public void convert2Html(String fileName, String outPutFile,Map<String, String> map) {
		HWPFDocument wordDocument=replaceDoc(fileName, map);
		WordToHtmlConverter wordToHtmlConverter;
		try {
			wordToHtmlConverter = new WordToHtmlConverter(DocumentBuilderFactory.newInstance().newDocumentBuilder().newDocument());
			wordToHtmlConverter.processDocument(wordDocument);
			Document htmlDocument = wordToHtmlConverter.getDocument();
			ByteArrayOutputStream out = new ByteArrayOutputStream();
			out.toString("UTF-8");
			DOMSource domSource = new DOMSource(htmlDocument);
			StreamResult streamResult = new StreamResult(out);
			TransformerFactory tf = TransformerFactory.newInstance();
			Transformer serializer = tf.newTransformer();
			serializer.setOutputProperty(OutputKeys.ENCODING, "UTF-8");
			serializer.setOutputProperty(OutputKeys.INDENT, "yes");
			serializer.setOutputProperty(OutputKeys.METHOD, "html");
			serializer.transform(domSource, streamResult);
			out.close();
			writeFile(new String(out.toByteArray(),"UTF-8"), outPutFile);
		} catch (ParserConfigurationException e) {
			e.printStackTrace();
		} catch (TransformerConfigurationException e) {
			e.printStackTrace();
		} catch (TransformerException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}		
	}*/
	
	/**
	 * 替换文本
	 * @param srcPath
	 * @param map
	 * @return
	 */
	
	/*public HWPFDocument replaceDoc(String srcPath, Map<String, String> map) {
		try {
			FileInputStream fis = new FileInputStream(new File(srcPath));// 读取word模板
			HWPFDocument doc = new HWPFDocument(fis);
			Range bodyRange = doc.getRange();// 读取word文本内容
			for (Map.Entry<String, String> entry : map.entrySet()) {// 替换文本内容
				if(StringUtils.equals(entry.getValue(), null)){
					bodyRange.replaceText("${" + entry.getKey() + "}", "");
				}else{
					bodyRange.replaceText("${" + entry.getKey() + "}", entry.getValue().toString());
				}
			}
			return doc;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}*/
	
	/**
	 * word转换jsp
	 * @param content
	 * @param path
	 */
	
	public void writeFile(String content, String path) {
		FileOutputStream fos = null;
		BufferedWriter bw = null;
		try {
			File file = new File(path);
			fos = new FileOutputStream(file);
			bw = new BufferedWriter(new OutputStreamWriter(fos,"UTF-8"));
			bw.write("<%@ page language=\"java\" import=\"java.util.*\" pageEncoding=\"UTF-8\"%>");
			bw.write(content);
		} catch (FileNotFoundException fnfe) {
			fnfe.printStackTrace();
		} catch (IOException ioe) {
			ioe.printStackTrace();
		} finally {
			try {
				if (bw != null)
					bw.close();
				if (fos != null)
					fos.close();
			} catch (IOException ie) {
				ie.printStackTrace();
			}
		}
	}
	
}
