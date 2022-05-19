import React from 'react';
import debug from 'sabio-debug';
import { PropTypes } from 'prop-types';
import './newsletterSubscriptionStyle.css';

const _logger = debug.extend('NewsletterSubscriptionCards');

const NewsletterSubscriptionCard = (props) => {
    const aNewsletterCard = props.aCard;
    _logger('Rendering Cards from NSCard.jsx', props);

    const handleClick = () => {
        _logger('successful attempt!');
        props.callUnsubscribe(aNewsletterCard);
    };

    return (
        <React.Fragment>
            <div className="container">
                <div className="row">
                    <a className="col rounded text-dark mx-4 my-2 d-flex align-items-center justify-content-center">
                        {aNewsletterCard.email}
                    </a>
                    <div
                        className="col col-lg-2 rounded text-white mx-4 my-1 "
                        style={{ width: 100, textAlign: 'center' }}>
                        <span className="badge badge-success bg-success text-light">Active</span>
                    </div>
                    <div className="col col-lg-2 rounded text-success d-flex align-items-center justify-content-center"></div>
                    <div className="col col-lg-2 btn-sm d-flex align-items-center justify-content-center">
                        <button
                            outline
                            type="submit"
                            className="btn btn-danger btn-sm rounded border border-danger shadow-lg"
                            onClick={handleClick}>
                            Unsubscribe
                        </button>
                    </div>
                </div>
            </div>
            <hr />
        </React.Fragment>
    );
};

NewsletterSubscriptionCard.propTypes = {
    callUnsubscribe: PropTypes.func,
    aCard: PropTypes.shape({
        email: PropTypes.string.isRequired,
    }),
};

export default NewsletterSubscriptionCard;
