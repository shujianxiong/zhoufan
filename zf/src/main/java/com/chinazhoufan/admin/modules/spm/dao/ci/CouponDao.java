/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/chinazhoufan/admin">JeeSite</a> All rights reserved.
 */
package com.chinazhoufan.admin.modules.spm.dao.ci;

import com.chinazhoufan.admin.common.persistence.CrudDao;
import com.chinazhoufan.admin.common.persistence.annotation.MyBatisDao;
import com.chinazhoufan.admin.modules.spm.entity.ci.Coupon;

/**
 * 优惠券DAO接口
 * @author 张金俊
 * @version 2016-12-02
 */
@MyBatisDao
public interface CouponDao extends CrudDao<Coupon> {
	
}