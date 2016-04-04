using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using WeiKe.Model;
using WeiKe.Repository;

namespace WeiKe.Service
{
    public class UsersService
    {
        public const string _TEACHER = "教师";
        public const string _STUDENT = "学生";
        public const string _SUPER = "超级管理员";

        public static IList<Users> FindByRoleName(string roleName) 
        {
            return UsersRepository.FindByRoleName(roleName);
        }

        public static bool Edit(Users inst) 
        {
            return UsersRepository.Update(inst) > 0;
        }

        public static Users GetById(int id) 
        {
            return UsersRepository.GetById(id);
        }
    }
}
