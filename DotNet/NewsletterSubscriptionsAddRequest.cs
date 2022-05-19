using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Sabio.Models.Requests
{
    public class NewsletterSubscriptionsAddRequest
    {
        [Required]
        [MinLength(1)]
        [MaxLength(255)]
        [EmailAddress]
        public string Email { get; set; }
    }
}
