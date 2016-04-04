using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using WeiKe.Model;
using System.Data;
using WeiKe.Infrastructure;

namespace WeiKe.Repository
{
    public class CourseItemRepository
    {
        public static int Add(CourseItem inst) 
        {
            string sql = "insert into courseItem (courseId,title,remark,addtime,filePath) ";
            sql += string.Format(" values({0},'{1}','{2}','{3}','{4}')", inst.courseId, inst.title, inst.remark, DateTime.Now, inst.filePath);
            if (OleDbHelper.ExecuteCommand(sql) > 0)
            {
                return OleDbHelper.GetScalar("select @@IDENTITY");
            }
            return 0;
        }

        public static int Update(CourseItem inst)
        {
            string sql = "udpate courseItem set "
                    + " courseId = " + inst.courseId
                    + " ,title = '"+inst.title+"'"
                    + " ,remark = '"+inst.remark+"'"
                    + " ,filePath = '" + inst.filePath+ "'"
                    + " where id = " + inst.id;
            return OleDbHelper.ExecuteCommand(sql);
        }

        public static int Delete(int id)
        {
            string sql = string.Format("delete from courseItem where id = {0}", id);
            return OleDbHelper.ExecuteCommand(sql);
        }


        public static CourseItem GetById(int id)
        {
            string sql = string.Format("select * from courseItem where id = {0}", id);
            CourseItem inst = null;
            using (DataTable dt = OleDbHelper.GetDataSet(sql))
            {
                foreach (DataRow r in dt.Rows)
                {
                    inst = Read(r);
                }
            }

            return inst;
        }

        public static IList<CourseItem> FindAll(string sql = "")
        {
            sql = string.IsNullOrEmpty(sql) ? "select * from CourseItem" : sql;
            IList<CourseItem> list = new List<CourseItem>();
            using (DataTable dt = OleDbHelper.GetDataSet(sql))
            {
                foreach (DataRow r in dt.Rows)
                {
                    list.Add(Read(r));
                }
            }
            return list;
        }

        public static IList<CourseItem> FindByCourseId(int courseId)
        {
            return FindAll(string.Format("select * from CourseItem where courseId = {0}", courseId));
        }

        private static CourseItem Read(DataRow r)
        {
            CourseItem inst = new CourseItem();
            inst.id = CommonUtil.ParseInt(r["id"]);
            inst.courseId = CommonUtil.ParseInt(r["courseId"]);
            inst.title = CommonUtil.ParseStr(r["title"]);
            inst.remark = CommonUtil.ParseStr(r["remark"]);
            inst.addtime = CommonUtil.ParseStr(r["addtime"]);
            inst.filePath = CommonUtil.ParseStr(r["filePath"]);
            return inst;
        }
    }
}
