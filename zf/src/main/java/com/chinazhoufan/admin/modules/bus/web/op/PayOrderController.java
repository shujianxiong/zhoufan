/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/chinazhoufan/admin">JeeSite</a> All rights reserved.
 */
package com.chinazhoufan.admin.modules.bus.web.op;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.chinazhoufan.admin.common.config.Global;
import com.chinazhoufan.admin.common.persistence.Page;
import com.chinazhoufan.admin.common.web.BaseController;
import com.chinazhoufan.admin.common.utils.StringUtils;
import com.chinazhoufan.admin.modules.bus.entity.op.PayOrder;
import com.chinazhoufan.admin.modules.bus.service.op.PayOrderService;

/**
 * 付款单Controller
 * @author 张金俊
 * @version 2017-08-21
 */
@Controller
@RequestMapping(value = "${adminPath}/bus/op/payOrder")
public class PayOrderController extends BaseController {

	@Autowired
	private PayOrderService payOrderService;
	
	@ModelAttribute
	public PayOrder get(@RequestParam(required=false) String id) {
		PayOrder entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = payOrderService.get(id);
		}
		if (entity == null){
			entity = new PayOrder();
		}
		return entity;
	}
	
	@RequiresPermissions("bus:op:payOrder:view")
	@RequestMapping(value = {"list", ""})
	public String list(PayOrder payOrder, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<PayOrder> page = payOrderService.findPage(new Page<PayOrder>(request, response), payOrder); 
		model.addAttribute("page", page);
		return "modules/bus/op/payOrderList";
	}

	@RequiresPermissions("bus:op:payOrder:view")
	@RequestMapping(value = "form")
	public String form(PayOrder payOrder, Model model) {
		model.addAttribute("payOrder", payOrder);
		return "modules/bus/op/payOrderForm";
	}

	@RequiresPermissions("bus:op:payOrder:edit")
	@RequestMapping(value = "save")
	public String save(PayOrder payOrder, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, payOrder)){
			return form(payOrder, model);
		}
		payOrderService.save(payOrder);
		addMessage(redirectAttributes, "保存付款单成功");
		return "redirect:"+Global.getAdminPath()+"/bus/op/payOrder/?repage";
	}
	
	@RequiresPermissions("bus:op:payOrder:edit")
	@RequestMapping(value = "delete")
	public String delete(PayOrder payOrder, RedirectAttributes redirectAttributes) {
		payOrderService.delete(payOrder);
		addMessage(redirectAttributes, "删除付款单成功");
		return "redirect:"+Global.getAdminPath()+"/bus/op/payOrder/?repage";
	}

    @RequiresPermissions("bus:op:payOrder:view")
    @RequestMapping(value = "info")
    public String info(PayOrder payOrder, Model model) {
        model.addAttribute("payOrder", payOrder);
        return "modules/bus/op/payOrderInfo";
    }
}