import React from 'react';
import { Formik, Form, Field } from 'formik';
import * as newsletterSubscriptionService from '../../services/newsletterSubscriptionService';
import debug from 'sabio-debug';
import './newsletterSubscriptionStyle.css';
import { PropTypes } from 'prop-types';
import Swal from 'sweetalert2';
const _logger = debug.extend('NewsletterSubscriptionForm');

const NewsletterSubscriptionForm = (props) => {
    _logger(props);
    const state = {
        formData: {
            email: '',
        },
    };

    const handleSubmit = (values, { resetForm }) => {
        newsletterSubscriptionService.add(values).then(onAddSubscriptionSuccess).catch(onAddSubscriptionError);
        if (onAddSubscriptionSuccess) {
            resetForm();
        }
    };

    const onAddSubscriptionSuccess = (response) => {
        _logger(response, 'form success');
        Swal.fire({
            title: 'You have successfully subscribed!',
            text: 'You will now get newsletters from Interrogas',
            icon: 'success',
            confirmButtonText: 'Okay',
        });
    };

    const onAddSubscriptionError = (error) => {
        _logger(error);
    };

    return (
        <React.Fragment>
            <div className="text-dark py-1">
                <div className="container">
                    <h1>Newsletter Subscription</h1>
                    <label htmlFor="email">Enter your email</label>
                    <Formik enableReinitialize={true} initialValues={state.formData} onSubmit={handleSubmit}>
                        <Form>
                            <div className="row">
                                <div className="col">
                                    <Field name="email" type="email" className="col col-lg-12" />
                                </div>
                                <div className="col">
                                    <button
                                        color="success"
                                        type="submit"
                                        className="btn btn-sm rounded bg-warning bg-gradient text-dark"
                                        style={{ marginRight: '2px' }}>
                                        Subscribe!
                                    </button>
                                </div>
                                <div className="col"></div>
                                <p className="text-dark">Want the latest news? Get it in your inbox!</p>
                            </div>
                        </Form>
                    </Formik>
                </div>
            </div>
        </React.Fragment>
    );
};

NewsletterSubscriptionForm.propTypes = {
    callSubscriptionList: PropTypes.func,
};
export default NewsletterSubscriptionForm;
