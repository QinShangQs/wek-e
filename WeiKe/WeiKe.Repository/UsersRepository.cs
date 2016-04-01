using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using WeiKe.Model;
using WeiKe.Infrastructure;
using System.Data;

namespace WeiKe.Repository
{
    public static class UsersRepository
    {
        public static int Add(Users inst)
        {
            string sql = "insert into users (name,email,sex,birthday,school,grad,parentName,parentPhone,headerImg,addtime,categoryId,pwd,roleName,phone,degree, experience)";
            sql += string.Format(" values('{0}','{1}','{2}','{3}','{4}','{5}','{6}','{7}','{8}','{9}',{10},'{11}','{12}','{13}','{14}','{15}');"//
                , inst.name, inst.email, inst.sex, inst.birthday, inst.school, inst.grad, inst.parentName, inst.parentPhone, inst.headerImg,
               DateTime.Now, inst.categoryId, inst.pwd, inst.roleName, inst.phone,inst.degree, inst.experience);
            if (OleDbHelper.ExecuteCommand(sql) > 0) 
            {
                return OleDbHelper.GetScalar("select @@IDENTITY");
            }
            return 0;
        }

        public static int Update(Users inst)
        {
            string sql = string.Format("update users "
                       + " set name = '{0}'"
                       + " ,email = '{1}'"
                       + " ,sex = '{2}'"
                       + " ,birthday = '{3}'"
                       + " ,school = '{4}'"
                       + " ,grad = '{5}'"
                       + " ,parentName = '{6}'"
                       + " ,parentPhone = '{7}'"
                       + " ,headerImg = '{8}'"
                       + " ,categoryId = {9}"
                       + " ,pwd = '{10}'"
                       + " ,roleName = '{11}'"
                       + " ,phone = '{12}'"
                       + " ,degree = '{13}'"
                       + " ,experience = '{14}'"
                       + " where id = {15}", inst.name, inst.email, inst.sex, inst.birthday, inst.school, inst.grad, inst.parentName, inst.parentPhone, inst.headerImg,
                       inst.categoryId,inst.pwd,inst.roleName,inst.phone,inst.degree,inst.experience, inst.id);
            return OleDbHelper.ExecuteCommand(sql);
        }

        public static int Delete(int id)
        {
            string sql = string.Format("delete from users where id = {0}", id);
            return OleDbHelper.ExecuteCommand(sql);
        }

        public static Users GetById(int id)
        {
            string sql = string.Format("select * from users where id = {0}", id);
            Users inst = null;
            using (DataTable dt = OleDbHelper.GetDataSet(sql))
            {
                foreach (DataRow r in dt.Rows)
                {
                    inst = Read(r);
                }
            }

            return inst;
        }

        private static IList<Users> FindAll(string sql = "")
        {
            sql = string.IsNullOrEmpty(sql) ? "select * from users" : sql;
            IList<Users> list = new List<Users>();
            using (DataTable dt = OleDbHelper.GetDataSet(sql))
            {
                foreach (DataRow r in dt.Rows)
                {
                    list.Add(Read(r));
                }
            }
            return list;
        }

        public static IList<Users> FindByRoleName(string roleName) 
        {
            return FindAll(string.Format("select * from users where roleName = '{0}'", roleName));
        }

        public static Users GetByName(string name) 
        {
            string sql = string.Format("select * from users where name = '{0}'", name);
            IList<Users> list = FindAll(sql);
            return list.Count > 0 ? list[0] : null;
        }

        private static Users Read(DataRow r)
        {
            Users inst = new Users();
            inst.id = CommonUtil.ParseInt(r["id"]);
            inst.name = CommonUtil.ParseStr(r["name"]);
            inst.pwd = CommonUtil.ParseStr(r["pwd"]);
            inst.email = CommonUtil.ParseStr(r["email"]);
            inst.sex = CommonUtil.ParseStr(r["sex"]);
            inst.birthday = CommonUtil.ParseStr(r["birthday"]);
            inst.school = CommonUtil.ParseStr(r["school"]);
            inst.grad = CommonUtil.ParseStr(r["grad"]);
            inst.parentName = CommonUtil.ParseStr(r["parentName"]);
            inst.parentPhone = CommonUtil.ParseStr(r["parentPhone"]);
            inst.headerImg = CommonUtil.ParseStr(r["headerImg"]);
            inst.addtime = CommonUtil.ParseStr(r["addtime"]);
            inst.categoryId = CommonUtil.ParseInt(r["categoryId"]);
            inst.roleName = CommonUtil.ParseStr(r["roleName"]);
            inst.phone = CommonUtil.ParseStr(r["phone"]);
            inst.degree = CommonUtil.ParseStr(r["degree"]);
            inst.experience = CommonUtil.ParseStr(r["experience"]);
            inst.category = CategoryRepository.GetById(CommonUtil.ParseInt(r["categoryId"]));
            return inst;
        }


    }
}
