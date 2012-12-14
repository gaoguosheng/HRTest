package com.ggs.hrtest.action;

import com.ggs.hrtest.dao.IRoleDao;
import com.ggs.hrtest.dao.impl.RoleDaoImpl;
import com.ggs.hrtest.model.BaseModel;
import com.ggs.hrtest.model.RoleModel;

/**
 * Created with IntelliJ IDEA.
 * User: ggs
 * Date: 12-12-14
 * Time: 下午3:18
 * To change this template use File | Settings | File Templates.
 */
public class RoleAction extends BaseAction {
    private RoleModel model = new RoleModel();
    private IRoleDao roleDao = new RoleDaoImpl();

    @Override
    public RoleModel getModel() {
        return model;
    }

    public void list(){
        this.outJson(roleDao.list());
    }

    public void getMenuList(){
        this.outJson(roleDao.getMenuList(this.getModel().getRoleid()));
    }
}
