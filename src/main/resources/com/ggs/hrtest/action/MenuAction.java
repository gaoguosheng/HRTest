package com.ggs.hrtest.action;

import com.ggs.hrtest.dao.IMenuDao;
import com.ggs.hrtest.dao.impl.MenuDaoImpl;
import com.ggs.hrtest.model.BaseModel;
import com.ggs.hrtest.model.MenuModel;

import java.util.List;

/**
 * Created with IntelliJ IDEA.
 * User: ggs
 * Date: 12-12-14
 * Time: 上午9:33
 * To change this template use File | Settings | File Templates.
 */
public class MenuAction extends BaseAction {

    private IMenuDao menuDao = new MenuDaoImpl();

    private MenuModel model = new MenuModel();


    @Override
    public MenuModel getModel() {
        return model;
    }

    /**
     * 菜单列表
     * */
    public void list(){
        List itemList = this.menuDao.list(this.getModel());
        this.outJson(itemList);
    }

}
