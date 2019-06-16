package com.dkd.business.form;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.Serializable;
import java.text.DateFormat;
import java.text.DecimalFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import com.dkd.business.bo.Sbb;
import com.dkd.system.bo.Dictionary;
import com.dkd.system.service.IDictionaryService;
import com.dkd.utils.uuid.UUIDGenerator;


public class ReadExcel implements Serializable{
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	//总行数
    private int totalRows = 0;  
    //总条数
    private int totalCells = 0; 
    //错误信息接收器
    private String errorMsg;
    //构造方法
    public ReadExcel(){}
    //获取总行数
    public int getTotalRows()  { return totalRows;} 
    //获取总列数
    public int getTotalCells() {  return totalCells;} 
    //获取错误信息
    public String getErrorInfo() { return errorMsg; } 
    @Resource
    private IDictionaryService dictionaryService;
    
  /**
   * 验证EXCEL文件
   * @param filePath
   * @return
   */
  public boolean validateExcel(String filePath){
        if (filePath == null || !(WDWUtil.isExcel2003(filePath) || WDWUtil.isExcel2007(filePath))){  
            errorMsg = "文件名不是excel格式";  
            return false;  
        }  
        return true;
  }
    
  /**
   * 读EXCEL文件，获取客户信息集合
   * @param fielName
   * @return
   */
  public List<Sbb> getExcelInfo(String fileName,MultipartFile Mfile){
      
      //把spring文件上传的MultipartFile转换成CommonsMultipartFile类型
       CommonsMultipartFile cf= (CommonsMultipartFile)Mfile; //获取本地存储路径
       File file = new  File("D:\\fileupload");
       //创建一个目录 （它的路径名由当前 File 对象指定，包括任一必须的父路径。）
       if (!file.exists()) file.mkdirs();
       //新建一个文件
       File file1 = new File("D:\\fileupload" + new Date().getTime() + ".xlsx"); 
       //将上传的文件写入新建的文件中
       try {
           cf.getFileItem().write(file1); 
       } catch (Exception e) {
           e.printStackTrace();
       }
       
       //初始化客户信息的集合    
       List<Sbb> customerList=new ArrayList<Sbb>();
       //初始化输入流
       InputStream is = null;  
       try{
          //验证文件名是否合格
          if(!validateExcel(fileName)){
              return null;
          }
          //根据文件名判断文件是2003版本还是2007版本
          boolean isExcel2003 = false; 
          if(WDWUtil.isExcel2007(fileName)){
              isExcel2003 = false;  
          }
          //根据新建的文件实例化输入流
          is = new FileInputStream(file1);
          //根据excel里面的内容读取客户信息
          customerList = getExcelInfo(is, isExcel2003); 
          is.close();
      }catch(Exception e){
          e.printStackTrace();
      } finally{
          if(is !=null)
          {
              try{
                  is.close();
              }catch(IOException e){
                  is = null;    
                  e.printStackTrace();  
              }
          }
      }
      return customerList;
  }
  /**
   * 根据excel里面的内容读取客户信息
   * @param is 输入流
   * @param isExcel2003 excel是2003还是2007版本
   * @return
   * @throws IOException
   */
  public  List<Sbb> getExcelInfo(InputStream is,boolean isExcel2003){
       List<Sbb> customerList=null;
       try{
           /** 根据版本选择创建Workbook的方式 */
           Workbook wb = null;
           //当excel是2003时
           if(isExcel2003){
               wb = new HSSFWorkbook(is); 
           }
           else{//当excel是2007时
               wb = new XSSFWorkbook(is); 
           }
           //读取Excel里面客户的信息
           customerList=readExcelValue(wb);
       }
       catch (IOException e)  {  
           e.printStackTrace();  
       }  
       return customerList;
  }
  /**
   * 读取Excel里面客户的信息
   * @param wb
   * @return
   */
  private List<Sbb> readExcelValue(Workbook wb){ 
	  Dictionary dictionary = new Dictionary();
      //得到第一个shell  
       Sheet sheet=wb.getSheetAt(0);
       
      //得到Excel的行数
       this.totalRows=sheet.getPhysicalNumberOfRows();
       
      //得到Excel的列数(前提是有行数)
       if(totalRows>=1 && sheet.getRow(0) != null){
            this.totalCells=sheet.getRow(0).getPhysicalNumberOfCells();
       }
       
       List<Sbb> customerList=new ArrayList<Sbb>();
       Sbb sbb;            
      //循环Excel行数,从第二行开始。标题不入库
       for(int r=1;r<totalRows;r++){
           Row row = sheet.getRow(r);
           if (row == null) continue;
           sbb = new Sbb();
           
           //循环Excel的列
           for(int c = 0; c <this.totalCells; c++){    
               Cell cell = row.getCell(c);
               row.getCell(c).setCellType(Cell.CELL_TYPE_STRING);
               if (null != cell){
                   if(c==0){//物品名
                	   sbb.setPm(cell.getStringCellValue());
                   }else if(c==1){
                	   row.getCell(c).setCellType(Cell.CELL_TYPE_STRING);
                	   String yjfl = cell.getStringCellValue(); 
                	   System.err.println(yjfl);
                	    Dictionary selectByName = dictionaryService.selectByName(yjfl);
                	   System.err.println(selectByName.getDictionary_name());
                	   if(!(" ".equals(selectByName.getDictionary_name())&& selectByName.getDictionary_name()==null )){
                		  System.out.println("sheve");
                		   sbb.setYjfl(dictionary.getDictionary_id());//一级分类
                	   }
                   }else if(c==2){
                	   //二级分类
                	   row.getCell(c).setCellType(Cell.CELL_TYPE_STRING);
                  	  String ejfl = cell.getStringCellValue();
                  	if(!(" ".equals(sbb.getYjfl())&& sbb.getYjfl()==null )){
                  		List<Dictionary> selectByParentId = dictionaryService.selectByParentId(sbb.getYjfl());
                  		for (Dictionary dictionary2 : selectByParentId) {
                  			if(dictionary2.getDictionary_name()==ejfl ||ejfl.equals(dictionary2.getDictionary_name()) ){
                  				sbb.setEjfl(dictionary2.getDictionary_id());
                  			}
                  			
						}
                  	}
                   }else if(c==3){
                	   row.getCell(c).setCellType(Cell.CELL_TYPE_STRING);
                   	  String sjfl = cell.getStringCellValue();
                	   if(!(" ".equals(sbb.getEjfl())&& sbb.getEjfl()==null )){
                     		List<Dictionary> selectByParentId = dictionaryService.selectByParentId(sbb.getEjfl());
                     		for (Dictionary dictionary2 : selectByParentId) {
                     			if(dictionary2.getDictionary_name()==sjfl ||sjfl.equals(dictionary2.getDictionary_name()) ){
                     				sbb.setSjfl(dictionary2.getDictionary_id());
                     			}
                     		}
                     	}
                	  
                  }else if(c==4){
					row.getCell(c).setCellType(Cell.CELL_TYPE_STRING);
                	   sbb.setSccs(cell.getStringCellValue());//生产厂商
                   }else if(c==5){
                	   row.getCell(c).setCellType(Cell.CELL_TYPE_STRING);
                	   sbb.setYws(cell.getStringCellValue());//运维商
                   }else if(c==6){
                	   row.getCell(c).setCellType(Cell.CELL_TYPE_NUMERIC);
                	   SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");  //日期格式化
                	  String format = sdf.format(cell.getDateCellValue());    
                	   Date date1=null;
					try {
						date1 = new SimpleDateFormat("yyyy-MM-dd").parse(format);
					} catch (ParseException e) {
						
						e.printStackTrace();
					}
                	   sbb.setDhrq(date1);//到货日期
                	
                   }else if(c==7){
                	   row.getCell(c).setCellType(Cell.CELL_TYPE_NUMERIC);
                	   SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");  //日期格式化
                	  String format = sdf.format(cell.getDateCellValue());    
                	   Date date1=null;
					try {
						date1 = new SimpleDateFormat("yyyy-MM-dd").parse(format);
					} catch (ParseException e) {
						e.printStackTrace();
					}
                	   sbb.setScrq(date1);//生产日期
                   }else if(c==8){
                	   sbb.setWbdh(cell.getStringCellValue());//维保电话
                   }else if(c==9){
                	   row.getCell(c).setCellType(Cell.CELL_TYPE_STRING);
                	   if("暂存".equals(cell.getStringCellValue())){
                		   sbb.setWply("2");//物品来源
                	   }else{
                		   sbb.setWply("1");//物品来源
                	   }
                   }else if(c==10){
                	   row.getCell(c).setCellType(Cell.CELL_TYPE_STRING);
                	   sbb.setWplydw(cell.getStringCellValue());//物品来源单位
                   }else if(c==11){
                	   row.getCell(c).setCellType(Cell.CELL_TYPE_STRING);
                	   sbb.setZcgg(cell.getStringCellValue());//资产规格
                   }else if(c==12){
                	   row.getCell(c).setCellType(Cell.CELL_TYPE_STRING);
                	   sbb.setZcxh(cell.getStringCellValue());//资产型号
                   }
                  
                   //设置id值
                   sbb.setSbid(UUIDGenerator.getUUID());
                   
               }
           }
          
           //添加客户
           customerList.add(sbb);
       }
       return customerList;
  }

}