using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using WeiKe.Model;
using System.Data;
using WeiKe.Infrastructure;

namespace WeiKe.Repository
{
    public class CommentsRepository
    {
        public static int Add(Comments inst)
        {
            string sql = "insert into Comments (userName,courseItemId,content,addtime) ";
            sql += string.Format(" values('{0}',{1},'{2}','{3}')",
                inst.userName, inst.courseItemId, inst.content, DateTime.Now);
            if (OleDbHelper.ExecuteCommand(sql) > 0)
            {
                return OleDbHelper.GetScalar("select @@IDENTITY");
            }
            return 0;
        }

        public static int Update(Comments inst)
        {
            string sql = "udpate Comments set "
                    + " userName = " + inst.userName
                    + " ,courseItemId = " + inst.courseItemId + ""
                    + " ,content = '" + inst.content + "'"
                    + " where id = " + inst.id;
            return OleDbHelper.ExecuteCommand(sql);
        }

        public static int Delete(int id)
        {
            string sql = string.Format("delete from Comments where id = {0}", id);
            return OleDbHelper.ExecuteCommand(sql);
        }


        public static Comments GetById(int id)
        {
            string sql = string.Format("select * from Comments where id = {0}", id);
            Comments inst = null;
            using (DataTable dt = OleDbHelper.GetDataSet(sql))
            {
                foreach (DataRow r in dt.Rows)
                {
                    inst = Read(r);
                }
            }

            return inst;
        }

        public static IList<Comments> FindAll(string sql = "")
        {
            sql = string.IsNullOrEmpty(sql) ? "select * from Comments" : sql;
            IList<Comments> list = new List<Comments>();
            using (DataTable dt = OleDbHelper.GetDataSet(sql))
            {
                foreach (DataRow r in dt.Rows)
                {
                    list.Add(Read(r));
                }
            }
            return list;
        }

        public static IList<Comments> FindByCourseItemId(int courseItemId)
        {
            string sql = "select * from Comments where courseItemId = " + courseItemId;
            return FindAll(sql);
        }

        private static Comments Read(DataRow r)
        {
            Comments inst = new Comments();
            inst.id = CommonUtil.ParseInt(r["id"]);
            inst.userName = CommonUtil.ParseStr(r["userName"]);
            inst.courseItemId = CommonUtil.ParseInt(r["courseItemId"]);
            inst.content = CommonUtil.ParseStr(r["content"]);
            inst.addtime = CommonUtil.ParseStr(r["addtime"]);
            return inst;
        }
    }
}
