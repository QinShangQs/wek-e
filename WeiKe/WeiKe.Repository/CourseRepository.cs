using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using WeiKe.Model;
using System.Data;
using WeiKe.Infrastructure;

namespace WeiKe.Repository
{
    public class CourseRepository
    {
        public static int Add(Course inst)
        {
            string sql = "insert into Course (teacherId,title,remark,unionNumber,grad,categoryName,addtime,picture) ";
            sql += string.Format(" values({0},'{1}','{2}','{3}','{4}','{5}','{6}','{7}')",
                inst.teacherId, inst.title, inst.remark, inst.unionNumber, inst.grad, inst.categoryName, DateTime.Now, inst.picture);
            if (OleDbHelper.ExecuteCommand(sql) > 0)
            {
                return OleDbHelper.GetScalar("select @@IDENTITY");
            }
            return 0;
        }

        public static int Update(Course inst)
        {
            string sql = "udpate Course set "
                    + " teacherId = " + inst.teacherId
                    + " ,title = '" + inst.title + "'"
                    + " ,remark = '" + inst.remark + "'"
                    + " ,unionNumber = '" + inst.unionNumber + "'"
                    + " ,grad = '" + inst.grad + "'"
                    + " ,categoryName = '" + inst.categoryName + "'"
                    + " ,picture = '"+inst.picture+"'"
                    + " where id = " + inst.id;
            return OleDbHelper.ExecuteCommand(sql);
        }

        public static int Delete(int id)
        {
            string sql = string.Format("delete from Course where id = {0}", id);
            return OleDbHelper.ExecuteCommand(sql);
        }

        public static Course GetById(int id)
        {
            string sql = string.Format("select * from Course where id = {0}", id);
            Course inst = null;
            using (DataTable dt = OleDbHelper.GetDataSet(sql))
            {
                foreach (DataRow r in dt.Rows)
                {
                    inst = Read(r);
                }
            }

            return inst;
        }

        public static IList<Course> FindAll(string sql = "")
        {
            sql = string.IsNullOrEmpty(sql) ? "select * from Course" : sql;
            IList<Course> list = new List<Course>();
            using (DataTable dt = OleDbHelper.GetDataSet(sql))
            {
                foreach (DataRow r in dt.Rows)
                {
                    list.Add(Read(r));
                }
            }
            return list;
        }

        public static IList<Course> FindByTeacherId(int teacherId)
        {
            return FindAll(string.Format("select * from Course where teacherId = {0}", teacherId));
        }

        private static Course Read(DataRow r)
        {
            Course inst = new Course();
            inst.id = CommonUtil.ParseInt(r["id"]);
            inst.teacherId = CommonUtil.ParseInt(r["teacherId"]);
            inst.title = CommonUtil.ParseStr(r["title"]);
            inst.remark = CommonUtil.ParseStr(r["remark"]);
            inst.unionNumber = CommonUtil.ParseStr(r["unionNumber"]);
            inst.grad = CommonUtil.ParseStr(r["grad"]);
            inst.categoryName = CommonUtil.ParseStr(r["categoryName"]);
            inst.addtime = CommonUtil.ParseStr(r["addtime"]);
            inst.picture = CommonUtil.ParseStr(r["picture"]);

            inst.teacher = UsersRepository.GetById(inst.teacherId);
            inst.items = CourseItemRepository.FindByCourseId(inst.id);
            return inst;
        }
    }
}
