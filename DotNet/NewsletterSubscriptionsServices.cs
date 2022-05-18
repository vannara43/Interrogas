using Sabio.Data;
using Sabio.Data.Providers;
using Sabio.Models;
using Sabio.Models.Domain;
using Sabio.Models.Requests;
using Sabio.Services.Newsletters;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Sabio.Services
{
    public class NewsletterSubscriptionsServices : INewslettersSubscriptionService
    {
        IDataProvider _data = null;
        public NewsletterSubscriptionsServices(IDataProvider data)
        {
            _data = data;
        }
        public void Add(NewsletterSubscriptionsAddRequest model)
        {
            string procName = "[dbo].[NewsletterSubscriptions_Insert]";
            _data.ExecuteNonQuery(procName, inputParamMapper: delegate (SqlParameterCollection col)
            {
                col.AddWithValue("@Email", model.Email);
            });
        }
        public Paged<NewsletterSubscription> IsSubscribed(int pageIndex, int pageSize, bool query)
        {
            Paged<NewsletterSubscription> pagedList = null;
            List<NewsletterSubscription> list = null;
            int totalCount = 0;
            _data.ExecuteCmd(
                "dbo.NewsletterSubscriptions_SelectAll_Subscribed",
                (param) =>
                {
                    param.AddWithValue("@PageIndex", pageIndex);
                    param.AddWithValue("@PageSize", pageSize);
                    param.AddWithValue("@Query", query);

                },
                (reader, recordSetIndex) =>
                {
                    NewsletterSubscription aNewsletterSubscriptions = Mapper(reader);
                    totalCount = reader.GetSafeInt32(4);

                    if (list == null)
                    {
                        list = new List<NewsletterSubscription>();
                    }
                    list.Add(aNewsletterSubscriptions);

                }
                );

                if (list != null)
                {
                    pagedList = new Paged<NewsletterSubscription>(list, pageIndex, pageSize, totalCount);
                }
                return pagedList;
        }
        public Paged<NewsletterSubscription> SearchPaginationRoleId(int pageIndex, int pageSize, int roleId)
        {

            Paged<NewsletterSubscription> pagedList = null;
            List<NewsletterSubscription> list = null;
            int totalCount = 0;
            _data.ExecuteCmd(
                "dbo.NewsletterSubscriptions_SelectByRoleId",
                (param) =>
                {
                    param.AddWithValue("@PageIndex", pageIndex);
                    param.AddWithValue("@PageSize", pageSize);
                    param.AddWithValue("@RoleId", roleId);

                },
                (reader, recordSetIndex) =>
                {
                    NewsletterSubscription aNewsletterSubscriptions = Mapper(reader);
                    totalCount = reader.GetSafeInt32(13);

                    if (list == null)
                    {
                        list = new List<NewsletterSubscription>();
                    }
                    list.Add(aNewsletterSubscriptions);
                    
                }
                );

            if (list != null)
            {
                pagedList = new Paged<NewsletterSubscription>(list, pageIndex, pageSize, totalCount);
            }
            return pagedList;
        }
        public void Update(string email)
        {
            string procName = "[dbo].[NewsletterSubscriptions_Unsubscribe]";
            _data.ExecuteNonQuery(procName, inputParamMapper: delegate (SqlParameterCollection col)
            {
                col.AddWithValue("@Email",email);

            }, returnParameters: null);
        }
        private static NewsletterSubscription Mapper(IDataReader reader)
        {
            NewsletterSubscription aNewsletterSubscriptions = new NewsletterSubscription();
            int startingIndex = 0;
            aNewsletterSubscriptions.Email = reader.GetSafeString(startingIndex++);
            return aNewsletterSubscriptions;
        }
    }
}
