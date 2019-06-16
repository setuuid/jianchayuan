package com.dkd.oura;

import java.io.Serializable;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

@Component
public class URLBean implements Serializable {
	private static final long serialVersionUID = 1L;

	private String url96011="http://10.93.8.50:8080/96011/j_spring_security_check?wsdc=1";
	private String url96011RC="RESOURCE_INDEX_960111";
	private boolean isAccess960111 = false;
	
	private String urljwpy="#";
	private String urljwpyRC="RESOURCE_INDEX_JWPY";
	private boolean isAccessJWPY = false;

	private String urlzhyw="#";
	private String urlzhywRC="RESOURCE_INDEX_ZHYW";
	private boolean isAccessZHYW = false;

	private String urlspdc="http://10.93.8.33:7000/PPIS/templates/autoLogin.html?username=admin01&password=1111&type=1";
	private String urlspdcRC="RESOURCE_INDEX_SPDC";
	private boolean isAccessSPDC = false;

	private String urlwxdc="#";
	private String urlwxdcRC="RESOURCE_INDEX_WXDC";
	private boolean isAccessWXDC = false;

	private String urlzfyw="#";
	private String urlzfywRC="RESOURCE_INDEX_ZFYW";
	private boolean isAccessZFYW = false;

	private String urldcsx="#";
	private String urldcsxRC="RESOURCE_INDEX_DCSX";
	private boolean isAccessDCSX = false;
	
	private String urlyydc="http://10.93.8.33:7000/PPIS/templates/autoLogin.html?username=admin01&password=1111&type=2";
	private String urlyydcRC="RESOURCE_INDEX_YYDC";
	private boolean isAccessYYDC = false;

	private String urlksh="#";
	private String urlkshRC="RESOURCE_INDEX_KSH";
	private boolean isAccessKSH = false;

	private String urlzfqy="#";
	private String urlzfqyRC="RESOURCE_INDEX_ZFQY";
	private boolean isAccessZFQY = false;

	private String urljfw = "http://10.88.153.152/login!platformLogin.action?username=ducha&password=827CCB0EEA8A706C4C34A16891F84E7B&type=0";
	private String urljfwRC="RESOURCE_INDEX_JFW";
	private boolean isAccessJFW = false;
	
	//private String urlflowwork="http://10.93.8.24:8080/wf/wf/taskRecord.do?entityID=";
//	
	//private String ipflowwork="http://10.93.8.24:8080/wf";
//	private String urlflowwork="http://tjsgajwsdc.java.tenv.cst.canic/GZL/V1.0/wf/taskRecord.do?entityID=";
//	
//	private String ipflowwork="http://tjsgajwsdc.java.tenv.cst.canic/GZL/V1.0";	
	private String urlflowwork="http://localhost:8080/wf/wf/taskRecord.do?entityID=";
	
	private String ipflowwork="http://localhost:8080/wf";
	
	public String getIpflowwork() {
		return ipflowwork;
	}

	public void setIpflowwork(String ipflowwork) {
		this.ipflowwork = ipflowwork;
	}

	public String getUrlflowwork() {
		return urlflowwork;
	}

	public void setUrlflowwork(String urlflowwork) {
		this.urlflowwork = urlflowwork;
	}

	public String getUrl96011() {
		return url96011;
	}

	public void setUrl96011(String url96011) {
		this.url96011 = url96011;
	}

	public String getUrljwpy() {
		return urljwpy;
	}

	public void setUrljwpy(String urljwpy) {
		this.urljwpy = urljwpy;
	}

	public String getUrlzhyw() {
		return urlzhyw;
	}

	public void setUrlzhyw(String urlzhyw) {
		this.urlzhyw = urlzhyw;
	}

	public String getUrlspdc() {
		return urlspdc;
	}

	public void setUrlspdc(String urlspdc) {
		this.urlspdc = urlspdc;
	}

	public String getUrlwxdc() {
		return urlwxdc;
	}

	public void setUrlwxdc(String urlwxdc) {
		this.urlwxdc = urlwxdc;
	}

	public String getUrlzfyw() {
		return urlzfyw;
	}

	public void setUrlzfyw(String urlzfyw) {
		this.urlzfyw = urlzfyw;
	}

	public String getUrlyydc() {
		return urlyydc;
	}

	public void setUrlyydc(String urlyydc) {
		this.urlyydc = urlyydc;
	}

	public String getUrlksh() {
		return urlksh;
	}

	public void setUrlksh(String urlksh) {
		this.urlksh = urlksh;
	}

	public String getUrl96011RC() {
		return url96011RC;
	}

	public void setUrl96011RC(String url96011RC) {
		this.url96011RC = url96011RC;
	}

	public boolean isAccess960111() {
		return isAccess960111;
	}

	public void setAccess960111(boolean isAccess960111) {
		this.isAccess960111 = isAccess960111;
	}

	public String getUrljwpyRC() {
		return urljwpyRC;
	}

	public void setUrljwpyRC(String urljwpyRC) {
		this.urljwpyRC = urljwpyRC;
	}

	public boolean isAccessJWPY() {
		return isAccessJWPY;
	}

	public void setAccessJWPY(boolean isAccessJWPY) {
		this.isAccessJWPY = isAccessJWPY;
	}

	public String getUrlzhywRC() {
		return urlzhywRC;
	}

	public void setUrlzhywRC(String urlzhywRC) {
		this.urlzhywRC = urlzhywRC;
	}

	public boolean isAccessZHYW() {
		return isAccessZHYW;
	}

	public void setAccessZHYW(boolean isAccessZHYW) {
		this.isAccessZHYW = isAccessZHYW;
	}

	public String getUrlspdcRC() {
		return urlspdcRC;
	}

	public void setUrlspdcRC(String urlspdcRC) {
		this.urlspdcRC = urlspdcRC;
	}

	public boolean isAccessSPDC() {
		return isAccessSPDC;
	}

	public void setAccessSPDC(boolean isAccessSPDC) {
		this.isAccessSPDC = isAccessSPDC;
	}

	public String getUrlwxdcRC() {
		return urlwxdcRC;
	}

	public void setUrlwxdcRC(String urlwxdcRC) {
		this.urlwxdcRC = urlwxdcRC;
	}

	public boolean isAccessWXDC() {
		return isAccessWXDC;
	}

	public void setAccessWXDC(boolean isAccessWXDC) {
		this.isAccessWXDC = isAccessWXDC;
	}

	public String getUrlzfywRC() {
		return urlzfywRC;
	}

	public void setUrlzfywRC(String urlzfywRC) {
		this.urlzfywRC = urlzfywRC;
	}

	public boolean isAccessZFYW() {
		return isAccessZFYW;
	}

	public void setAccessZFYW(boolean isAccessZFYW) {
		this.isAccessZFYW = isAccessZFYW;
	}

	public String getUrlyydcRC() {
		return urlyydcRC;
	}

	public void setUrlyydcRC(String urlyydcRC) {
		this.urlyydcRC = urlyydcRC;
	}

	public boolean isAccessYYDC() {
		return isAccessYYDC;
	}

	public void setAccessYYDC(boolean isAccessYYDC) {
		this.isAccessYYDC = isAccessYYDC;
	}

	public String getUrlkshRC() {
		return urlkshRC;
	}

	public void setUrlkshRC(String urlkshRC) {
		this.urlkshRC = urlkshRC;
	}

	public boolean isAccessKSH() {
		return isAccessKSH;
	}

	public void setAccessKSH(boolean isAccessKSH) {
		this.isAccessKSH = isAccessKSH;
	}

	public String getUrlzfqy() {
		return urlzfqy;
	}

	public void setUrlzfqy(String urlzfqy) {
		this.urlzfqy = urlzfqy;
	}

	public String getUrlzfqyRC() {
		return urlzfqyRC;
	}

	public void setUrlzfqyRC(String urlzfqyRC) {
		this.urlzfqyRC = urlzfqyRC;
	}

	public boolean isAccessZFQY() {
		return isAccessZFQY;
	}

	public void setAccessZFQY(boolean isAccessZFQY) {
		this.isAccessZFQY = isAccessZFQY;
	}

	public String getUrljfw() {
		return urljfw;
	}

	public void setUrljfw(String urljfw) {
		this.urljfw = urljfw;
	}

	public String getUrljfwRC() {
		return urljfwRC;
	}

	public void setUrljfwRC(String urljfwRC) {
		this.urljfwRC = urljfwRC;
	}

	public boolean isAccessJFW() {
		return isAccessJFW;
	}

	public void setAccessJFW(boolean isAccessJFW) {
		this.isAccessJFW = isAccessJFW;
	}

	public String getUrldcsx() {
		return urldcsx;
	}

	public void setUrldcsx(String urldcsx) {
		this.urldcsx = urldcsx;
	}

	public String getUrldcsxRC() {
		return urldcsxRC;
	}

	public void setUrldcsxRC(String urldcsxRC) {
		this.urldcsxRC = urldcsxRC;
	}

	public boolean isAccessDCSX() {
		return isAccessDCSX;
	}

	public void setAccessDCSX(boolean isAccessDCSX) {
		this.isAccessDCSX = isAccessDCSX;
	}
	
}
