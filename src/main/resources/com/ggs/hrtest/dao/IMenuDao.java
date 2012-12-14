package com.ggs.hrtest.dao;

import com.ggs.hrtest.model.MenuModel;
import com.ggs.hrtest.model.PageModel;

import java.util.List;

/**
 * Created with IntelliJ IDEA.
 * User: ggs
 * Date: 12-12-14
 * Time: 上午9:35
 * To change this template use File | Settings | File Templates.
 */
public interface IMenuDao {
    public List list(MenuModel menuModel);
}
