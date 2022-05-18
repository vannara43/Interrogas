using Sabio.Models;
using Sabio.Models.Domain;
using Sabio.Models.Requests;
using Sabio.Models.Requests.NewsletterSubsctiption;

namespace Sabio.Services.Newsletters
{
    public interface INewslettersSubscriptionService
    {
        void Add(NewsletterSubscriptionsAddRequest model);
        Paged<NewsletterSubscription> SearchPaginationRoleId(int pageIndex, int pageSize, int roleId);
        Paged<NewsletterSubscription> IsSubscribed(int pageIndex, int pageSize, bool query);
        void Update(string email);
    }
}
