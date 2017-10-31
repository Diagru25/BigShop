using Model.EF;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Model.DAO
{
    public class UserDao
    {
        BigShopDbContext db = null;

        public UserDao()
        {
            db = new BigShopDbContext();
        }

        public long Insert(User entity)
        {
            db.Users.Add(entity);
            db.SaveChanges();
            return entity.ID;
        }
        public bool Edit(User entity)
        {
            try
            {
                var user = db.Users.Find(entity.ID);

                user.Name = entity.Name;
                user.Address = entity.Address;
                user.Email = entity.Email;
                user.Phone = entity.Phone;
                db.SaveChanges();
                return true;
            }
            catch (Exception ex)
            {
                return false;
            }
        }
        public bool Delete(int id)
        {
            try
            {
                var user = db.Users.Find(id);

                db.Users.Remove(user);

                db.SaveChanges();

                return true;
            }
            catch (Exception ex)
            {
                return false;
            }
        }
        public bool CheckUserName(string username)
        {
            return db.Users.Count(x => x.UserName == username) > 0;
        }
        public bool CheckEmail(string email)
        {
            return db.Users.Count(x => x.Email == email) > 0;
        }
        public User GetUserByUserName(string username)
        {
            return db.Users.SingleOrDefault(x => x.UserName == username);
        }
        public int Login(string userName, string passWord)
        {
            var result = db.Users.SingleOrDefault(x => x.UserName == userName);

            if (result == null)
            {
                return 0;
            }
            else
            {
                if (result.Status == false)
                {
                    return -1;
                }
                else
                {
                    if (result.PassWord == passWord)
                    {
                        if (result.Type == 2)
                        {
                            return 3;
                        }
                        if(result.Type == 1)
                        {
                            return 2;
                        }
                        return 1;
                    }
                    else
                    {
                        return -2;
                    }
                }
            }
        }

        public List<User> ListAll()
        {
            return db.Users.ToList();
        }
        public bool Manipulation(int id)
        {
            User user = db.Users.Find(id);

            if (user.Status == true)
                user.Status = false;
            else
                user.Status = true;
            db.SaveChanges();
            return true;
        }
        public User GetById(long id)
        {
            return db.Users.Find(id);
        }
        public bool ChangeType(int id, int type, string action)
        {
            var user = db.Users.Find(id);
            if (action == "up") user.Type +=1;
            if (action == "down") user.Type-=1;
            db.SaveChanges();
            return true;
        }
    }
}
