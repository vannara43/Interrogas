using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;
using Sabio.Models;
using Sabio.Models.Domain;
using Sabio.Models.Requests;
using Sabio.Services;
using Sabio.Services.Newsletters;
using Sabio.Web.Controllers;
using Sabio.Web.Core.Services;
using Sabio.Web.Models.Responses;
using System;
using System.Collections.Generic;

namespace Sabio.Web.Api.Controllers
{
    [Route("api/newsletters/subscriptions")]
    [ApiController]
    public class NewsletterSubscriptionsApiController : BaseApiController
    {
        private INewslettersSubscriptionService _service = null;
        private IAuthenticationService<int> _authService = null;
        public NewsletterSubscriptionsApiController(INewslettersSubscriptionService service
            , ILogger<NewsletterSubscriptionsApiController> logger
            , IAuthenticationService<int> authService) : base(logger)
        {
            _service = service;
            _authService = authService;
        }
        [HttpPost]
        [AllowAnonymous]
        public ActionResult<SuccessResponse> Create(NewsletterSubscriptionsAddRequest model)
        {
            IUserAuthData user = _authService.GetCurrentUser();
            int code = 200;
            BaseResponse response = null;
            try
            {
                _service.Add(model);
                return StatusCode(code, new SuccessResponse());
            }
            catch (Exception ex)
            {
                base.Logger.LogError(ex.ToString());
                code = 500;
                response = new ErrorResponse(ex.Message);
            }
            return StatusCode(code, response);
        }

        [HttpGet]
        public ActionResult<ItemResponse<Paged<NewsletterSubscription>>> IsSubscribed(int pageIndex, int pageSize, bool query)
        {
            int code = 200;
            BaseResponse response = null; 
            try
            {
                Paged<NewsletterSubscription> page = _service.IsSubscribed(pageIndex, pageSize, query);
                if (page == null)
                {
                    code = 404;
                    response = new ErrorResponse("App Resource not found.");
                }
                else
                {
                    response = new ItemResponse<Paged<NewsletterSubscription>> { Item = page };
                }
            }
            catch (Exception ex)
            {
                code = 500;
                response = new ErrorResponse(ex.Message);
                base.Logger.LogError(ex.ToString());
            }
            return StatusCode(code, response);
        }

        [HttpGet("roleid")]
        public ActionResult<ItemResponse<Paged<NewsletterSubscription>>> GetPage(int pageIndex, int pageSize, int roleId)
        {
            int code = 200;
            BaseResponse response = null;
            try
            {
                Paged<NewsletterSubscription> page = _service.SearchPaginationRoleId(pageIndex, pageSize, roleId);

                if (page == null)
                {
                    code = 404;
                    response = new ErrorResponse("App Resource not found.");
                }
                else
                {
                    response = new ItemResponse<Paged<NewsletterSubscription>> { Item = page };
                }
            }
            catch (Exception ex)
            {
                code = 500;
                response = new ErrorResponse(ex.Message);
                base.Logger.LogError(ex.ToString());
            }
            return StatusCode(code, response);
        }

        [HttpPut("{email}")]
        public ActionResult<SuccessResponse> Update(string email)
        {
            int code = 200;
            BaseResponse response = null;
            try
            {
                _service.Update(email);
                response = new SuccessResponse();
            }
            catch (Exception ex)
            {
                base.Logger.LogError(ex.ToString());
                code = 500;
                response = new ErrorResponse(ex.Message);
            }
            return StatusCode(code, response);
        }
    }
}
