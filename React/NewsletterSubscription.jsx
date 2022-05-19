import React, { useEffect, useState } from 'react';
import debug from 'sabio-debug';
import * as newsletterSubscriptionService from '../../services/newsletterSubscriptionService';
import NewsletterSubscriptionCard from './NewsletterSubscriptionCard';
import ReactPagination from 'react-paginate';
import './newsletterSubscriptionStyle.css';

function NewsletterSubscription() {
    const _logger = debug.extend('NewsletterSubscription');

    const [state, setState] = useState({
        newsletterItems: [],
        newsletterComponents: [],
    });

    const [totalPages, setTotalPages] = useState(0);
    const [currentPage, setCurrentPage] = useState(0);
    const [pageSize] = useState(10);

    const callUnsubscribe = (data) => {
        const dataObj = { Email: data.email, IsSubscribed: false };
        newsletterSubscriptionService.unsubscribe(dataObj.Email).then(onUnsubscribeSuccess).catch(onUnsubscribeError);
        _logger('Calling to Unsubscribe.', dataObj);
    };

    const onUnsubscribeSuccess = (response) => {
        _logger('Unsubscribe Success!', response);
        callSubscriptionList();
    };

    const onUnsubscribeError = (err) => {
        _logger('Unsubscribe Fail!', err);
    };

    useEffect(() => {
        callSubscriptionList();
    }, [currentPage]);

    const callSubscriptionList = () => {
        newsletterSubscriptionService
            .getAll(currentPage, pageSize)
            .then(onSubscriptionListSuccess)
            .catch(onSubscriptionListError);
    };

    const onSubscriptionListSuccess = (data) => {
        _logger('Rendering...', data);
        let arrayOfPeeps = data.item.pagedItems;
        setTotalPages(data.item.totalPages);
        setState((prevState) => {
            const pd = { ...prevState };
            pd.newsletterItems = arrayOfPeeps;
            pd.newsletterComponents = arrayOfPeeps.map(mapSubscriptionCard);
            return pd;
        });
    };

    const onSubscriptionListError = (err) => {
        _logger('fail attempt!', err);
    };

    const mapSubscriptionCard = (aSubscription) => {
        return (
            <NewsletterSubscriptionCard
                key={`Email: ${aSubscription.email}`}
                aCard={aSubscription}
                callUnsubscribe={callUnsubscribe}
            />
        );
    };

    const handlePageClick = (e) => {
        _logger(e.selected, 'clicked');
        let pageNumber = e.selected;
        setCurrentPage(pageNumber, callSubscriptionList());
    };

    return (
        <React.Fragment>
            <div className="container">
                <div className=" text-dark rounded nshover shadow">
                    <h1 className="mx-1 d-flex align-items-center justify-content-center p-2">
                        Newsletter Active List
                    </h1>
                    <div className="rounded">
                        <div className="row ">
                            <div className="col d-flex align-items-center justify-content-center">
                                <h4>Email Address</h4>
                            </div>
                            <div className="col col-lg-2 d-flex align-items-center justify-content-center">
                                <h4>Is Subscribed?</h4>
                            </div>
                            <div className="col col-lg-2 d-flex align-items-center justify-content-center"></div>
                            <div className="col col-lg-2 d-flex align-items-center justify-content-center">
                                <h4>Action</h4>
                            </div>
                        </div>
                    </div>

                    <div className="container">
                        <div className="row">{state.newsletterItems.map(mapSubscriptionCard)}</div>
                    </div>

                    <div className="d-flex justify-content-end">
                        <ReactPagination
                            previousLabel={'Previous'}
                            nextLabel={'Next'}
                            breakLabel={'...'}
                            pageCount={totalPages}
                            marginPagesDisplayed={1}
                            pageRangeDisplayed={totalPages}
                            onPageChange={handlePageClick}
                            containerClassName={'pagination'}
                            pageClassName={'page-item'}
                            pageLinkClassName={'page-link text-dark bg-gradient nshover'}
                            previousClassName={'page-item'}
                            previousLinkClassName={'page-link text-dark bg-gradient nshover'}
                            nextClassName={'page-item'}
                            nextLinkClassName={'page-link text-dark bg-gradient nshover'}
                            activeClassName={'bg-dark'}
                        />
                    </div>
                </div>
            </div>
        </React.Fragment>
    );
}

export default NewsletterSubscription;

