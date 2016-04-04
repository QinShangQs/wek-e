using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using WeiKe.Model;
using WeiKe.Repository;

namespace WeiKe.Service
{
    public class CommentsService
    {
        public static bool Create(Comments inst)
        {
            return CommentsRepository.Add(inst) > 0;
        }

        public static IList<Comments> RetrievesByCourseItemId(int courseItemId)
        {
            return CommentsRepository.FindByCourseItemId(courseItemId);
        }
    }
}
