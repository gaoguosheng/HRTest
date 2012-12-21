package com.ggs.util;


import org.hibernate.*;

import org.hibernate.cfg.Configuration;
import org.hibernate.transform.Transformers;

import java.io.Serializable;
import java.util.List;
import java.util.Map;


public class HibernateUtil {


    private String CONFIG_FILE_LOCATION = "/hibernate.cfg.xml";
    private  Configuration configuration = new Configuration();
    private org.hibernate.SessionFactory sessionFactory;
    private String configFile = CONFIG_FILE_LOCATION;

    public HibernateUtil() {
        try {
            configuration.configure(configFile);
            sessionFactory = configuration.buildSessionFactory();
        } catch (Exception e) {
            System.err
                    .println("%%%% Error Creating SessionFactory %%%%");
            e.printStackTrace();
        }
    }
	
	/**
     * Returns the ThreadLocal Session instance.  Lazy initialize
     * the <code>SessionFactory</code> if needed.
     *
     *  @return Session
     *  @throws org.hibernate.HibernateException
     */
    public Session getSession() throws HibernateException {
        Session session = sessionFactory.openSession();
        return session;
    }
	/**
     *  Rebuild hibernate session factory
     *
     */
	public void rebuildSessionFactory() {
		try {
			configuration.configure(configFile);
			sessionFactory = configuration.buildSessionFactory();
		} catch (Exception e) {
			System.err
					.println("%%%% Error Creating SessionFactory %%%%");
			e.printStackTrace();
		}
	}
	/**
     *  return session factory
     *
     */
	public org.hibernate.SessionFactory getSessionFactory() {
		return sessionFactory;
	}

    public void save(Object o){
        Session session = getSession();
        Transaction tx = session.beginTransaction();
        try{
            session.save(o);
            tx.commit();
        }catch (Exception e){
            tx.rollback();
            e.printStackTrace();
        }finally {
            session.close();
        }
    }

    public void update(Object o){
        Session session = getSession();
        Transaction tx = session.beginTransaction();
        try{
            session.update(o);
            tx.commit();
        }catch (Exception e){
            tx.rollback();
            e.printStackTrace();
        }finally {
            session.close();
        }
    }

    public void saveOrUpdate(Object o){
        Session session = getSession();
        Transaction tx = session.beginTransaction();
        try{
            session.saveOrUpdate(o);
            tx.commit();
        }catch (Exception e){
            tx.rollback();
            e.printStackTrace();
        }finally {
            session.close();
        }
    }

    public void delete(Object o){
        Session session = getSession();
        Transaction tx = session.beginTransaction();
        try{
            session.delete(o);
            tx.commit();
        }catch (Exception e){
            tx.rollback();
            e.printStackTrace();
        }finally {
            session.close();
        }
    }

    public void delete(Class c,Serializable id){
        Session session = getSession();
        Transaction tx = session.beginTransaction();
        try{
            session.delete(session.get(c,id));
            tx.commit();
        }catch (Exception e){
            tx.rollback();
            e.printStackTrace();
        }finally {
            session.close();
        }
    }

    public Object get(Class c, Serializable id){
        Session session = getSession();
        Object o  = session.get(c,id);
        session.close();
        return o;
    }

    public List query(String hql){
        Session session = getSession();
        Query query = session.createQuery(hql);
        List list = query.list();
        session.close();
        return list;
    }

    public List query(String hql,Object[]o ){
        List list = null;
        Session session = getSession();
        Query query = session.createQuery(hql);
        for(int i=0;i<o.length;i++){
            query.setParameter(i,o[i]);
        }
        try{
            list = query.list();
        }catch (Exception e){
            e.printStackTrace();
        }finally {
            session.close();
        }
        return list;
    }

    public List<Map<String,Object>> sqlQuery(String sql){
        Session session = getSession();
        SQLQuery query = session.createSQLQuery(sql);
        query.setResultTransformer(Transformers.ALIAS_TO_ENTITY_MAP);
        List list = query.list();
        session.close();
        return list;
    }

    public  List<Map<String,Object>> sqlQuery(String sql,int firstFesult,int maxResults){
        Session session = getSession();
        SQLQuery query = session.createSQLQuery(sql);
        query.setResultTransformer(Transformers.ALIAS_TO_ENTITY_MAP);
        query.setFirstResult(firstFesult*maxResults);
        query.setMaxResults(maxResults);
        List list = query.list();
        session.close();
        return list;
    }


    public List<Map<String,Object>> sqlQuery(String sql,Object[]o){
        Session session = getSession();
        SQLQuery query = session.createSQLQuery(sql);
        query.setResultTransformer(Transformers.ALIAS_TO_ENTITY_MAP);
        for(int i=0;i<o.length;i++){
            query.setParameter(i,o[i]);
        }
        List list = query.list();
        session.close();
        return list;
    }

    public void batchSave(Object[]o){
        Session session = getSession();
        Transaction tx = session.beginTransaction();
        try{
            for(Object po:o){
                session.save(po);
            }
            tx.commit();
        }catch (Exception e){
            tx.rollback();
            e.printStackTrace();
        }finally {
            session.close();
        }
    }


    public  void batchSaveOrUpdate(Object[]o){
        Session session = getSession();
        Transaction tx = session.beginTransaction();
        try{
            for(Object po:o){
                session.saveOrUpdate(po);
            }
            tx.commit();
        }catch (Exception e){
            tx.rollback();
            e.printStackTrace();
        }finally {
            session.close();
        }
    }


    public  int countForInt(String sql){
        int result=0;
        Session session = getSession();
        SQLQuery query = session.createSQLQuery(sql);
        List list = query.list();
        result=list.size();
        session.close();
        return result;
    }

    public  Object queryOneObject(String hql,Object[]o ){
        Object result = null;
        Session session = getSession();
        Query query = session.createQuery(hql);
        for(int i=0;i<o.length;i++){
            query.setParameter(i,o[i]);
        }
        try{
            List list = query.list();
            if(list.size()>0){
                result = list.get(0);
            }

        }catch (Exception e){
            e.printStackTrace();
        }finally {
            session.close();
        }
        return result;
    }

    public  void executeUpdate(String hql){
        Session session = getSession();
        Transaction tx = session.beginTransaction();
        try{
            Query query = session.createQuery(hql);
            query.executeUpdate();
            tx.commit();
        }catch (Exception e){
            tx.rollback();
            e.printStackTrace();
        }finally {
            session.close();
        }
    }

    public  void executeUpdate(String hql,Object[]o){
        Session session = getSession();
        Transaction tx = session.beginTransaction();
        try{
            Query query = session.createQuery(hql);
            for(int i=0;i<o.length;i++){
                query.setParameter(i,o[i]);
            }
            query.executeUpdate();
            tx.commit();
        }catch (Exception e){
            tx.rollback();
            e.printStackTrace();
        }finally {
            session.close();
        }
    }

}