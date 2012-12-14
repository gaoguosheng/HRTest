package com.ggs.util;


import org.hibernate.*;

import org.hibernate.cfg.Configuration;
import org.hibernate.transform.Transformers;

import java.io.Serializable;
import java.util.List;
import java.util.Map;


public class HibernateUtil {


    private static String CONFIG_FILE_LOCATION = "/hibernate.cfg.xml";
    private  static Configuration configuration = new Configuration();
    private static org.hibernate.SessionFactory sessionFactory;
    private static String configFile = CONFIG_FILE_LOCATION;

	static {
    	try {
			configuration.configure(configFile);
			sessionFactory = configuration.buildSessionFactory();
		} catch (Exception e) {
			System.err
					.println("%%%% Error Creating SessionFactory %%%%");
			e.printStackTrace();
		}
    }
    private HibernateUtil() {
    }
	
	/**
     * Returns the ThreadLocal Session instance.  Lazy initialize
     * the <code>SessionFactory</code> if needed.
     *
     *  @return Session
     *  @throws org.hibernate.HibernateException
     */
    public static Session getSession() throws HibernateException {
        Session session = sessionFactory.openSession();
        return session;
    }

	/**
     *  Rebuild hibernate session factory
     *
     */
	public static void rebuildSessionFactory() {
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
	public static org.hibernate.SessionFactory getSessionFactory() {
		return sessionFactory;
	}

	/**
     *  return session factory
     *
     *	session factory will be rebuilded in the next call
     */
	public static void setConfigFile(String configFile) {
		HibernateUtil.configFile = configFile;
		sessionFactory = null;
	}

	/**
     *  return hibernate configuration
     *
     */
	public static Configuration getConfiguration() {
		return configuration;
	}

    public static void save(Object o){
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

    public static void update(Object o){
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

    public static void saveOrUpdate(Object o){
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

    public static void delete(Object o){
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

    public static void delete(Class c,Serializable id){
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

    public static Object get(Class c, Serializable id){
        Session session = getSession();
        Object o  = session.get(c,id);
        session.close();
        return o;
    }

    public static List query(String hql){
        Session session = getSession();
        Query query = session.createQuery(hql);
        List list = query.list();
        session.close();
        return list;
    }

    public static List query(String hql,Object[]o ){
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

    public static List<Map<String,Object>> sqlQuery(String sql){
        Session session = getSession();
        SQLQuery query = session.createSQLQuery(sql);
        query.setResultTransformer(Transformers.ALIAS_TO_ENTITY_MAP);
        List list = query.list();
        session.close();
        return list;
    }

    public static List<Map<String,Object>> sqlQuery(String sql,int firstFesult,int maxResults){
        Session session = getSession();
        SQLQuery query = session.createSQLQuery(sql);
        query.setResultTransformer(Transformers.ALIAS_TO_ENTITY_MAP);
        query.setFirstResult(firstFesult);
        query.setMaxResults(maxResults);
        List list = query.list();
        session.close();
        return list;
    }


    public static List<Map<String,Object>> sqlQuery(String sql,Object[]o){
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

    public static void batchSave(Object[]o){
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


    public static void batchSaveOrUpdate(Object[]o){
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


    public static int countForInt(String sql){
        int result=0;
        Session session = getSession();
        SQLQuery query = session.createSQLQuery(sql);
        List list = query.list();
        result=list.size();
        session.close();
        return result;
    }

    public static Object queryOneObject(String hql,Object[]o ){
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

    public static void executeUpdate(String hql){
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

    public static void executeUpdate(String hql,Object[]o){
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