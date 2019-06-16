package com.dkd.system.util.annotation;

import java.lang.annotation.*;


/**
 * 获取属性中文名称
 * @author jsp
 *
 */
@Target({ElementType.FIELD,ElementType.METHOD})
@Retention(RetentionPolicy.RUNTIME)
@Documented 
public @interface GetAttributeName {

	String attributeName();
}
