package com.dkd.utils.json;

import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

public class JsonResult<T> {

    private boolean isSuccess;

    private List<T> rows;
    private List<T> data;
    private String error;
    //private List<FieldErrorResponse> fes = new ArrayList<FieldErrorResponse>();
    private String successMessage;

    private int draw;
    private long total;
    private long recordsFiltered;
    private T t;
    private Map<Object,Object> map;

    public JsonResult<T> createSuccessJsonResult(List<T> datas) {
        isSuccess = true;
        this.rows = datas;
        return this;
    }
    
    public JsonResult<T> createSuccessJsonResult(T t) {
        isSuccess = true;
        this.t = t;
        return this;
    }
    
    public JsonResult<T> createSuccessJsonResult(Map<Object,Object> map) {
        isSuccess = true;
        this.map = map;
        return this;
    }


    public JsonResult<T> createSuccessJsonResult(int draw, long recordsTotal, List<T> datas) {
        isSuccess = true;
        this.rows = datas;
        this.draw = draw;
        this.total = recordsTotal;
        this.recordsFiltered = recordsTotal;
        return this;
    }
   
   


    public JsonResult<T> createSuccessJsonResult() {
        isSuccess = true;
        return this;
    }
    
    public JsonResult<T> createSuccessJsonResult(String successMessage) {
        isSuccess = true;
        this.successMessage = successMessage;
        return this;
    }


    public JsonResult<T> createErrorJsonResult(String errors) {
        isSuccess = false;
        this.error = errors;
        return this;
    }

    public JsonResult<T> createErrorJsonResult() {
        isSuccess = false;
        return this;
    }

   /* public JsonResult<T> createErrorJsonResult(BindingResult bindingResult) {
        this.isSuccess = false;
        for (FieldError fe : bindingResult.getFieldErrors()) {
            fes.add(new FieldErrorResponse(fe.getDefaultMessage(), fe.getObjectName(), fe.getField(), fe.getRejectedValue()));
        }
        return this;
    }

    public List<FieldErrorResponse> getFes() {
        return fes;
    }*/


   /* public void setFes(List<FieldErrorResponse> fes) {
        this.fes = fes;
    }*/


    public boolean isSuccess() {
        return isSuccess;
    }


    public void setSuccess(boolean isSuccess) {
        this.isSuccess = isSuccess;
    }


    public List<T> getRows() {
        return rows;
    }


    public void setRows(List<T> data) {
        this.rows = data;
    }


    public String getError() {
        return error;
    }


    public void setError(String error) {
        this.error = error;
    }

    public int getDraw() {
        return draw;
    }

    public void setDraw(int draw) {
        this.draw = draw;
    }

    public long getTotal() {
        return total;
    }

    public void setTotal(long recordsTotal) {
        this.total = recordsTotal;
    }

    public long getRecordsFiltered() {
        return recordsFiltered;
    }

    public void setRecordsFiltered(long recordsFiltered) {
        this.recordsFiltered = recordsFiltered;
    }


	public List<T> getData() {
		return data;
	}


	public void setData(List<T> data) {
		this.data = data;
	}

	public T getT() {
		return t;
	}

	public void setT(T t) {
		this.t = t;
	}

	public String getSuccessMessage() {
		return successMessage;
	}

	public void setSuccessMessage(String successMessage) {
		this.successMessage = successMessage;
	}

	public Map<Object, Object> getMap() {
		return map;
	}

	public void setMap(Map<Object, Object> map) {
		this.map = map;
	}

	
	
}
