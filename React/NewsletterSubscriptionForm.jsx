import React from 'react';
import { Container, Row, Col } from 'react-bootstrap';
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
            <section className="py-5">
                <Container>
                    <Row>
                        <Col>
                            <div className="text-center pb-2">
                                <h3>Newsletter Subscription</h3>
                            </div>
                            <div className="text-center">
                                <Formik
                                    enableReinitialize={true}
                                    initialValues={state.formData}
                                    onSubmit={handleSubmit}>
                                    <Form className="form-inline">
                                        <label htmlFor="email" className="mb-2">
                                            <span className="text-primary">Enter your email</span>
                                        </label>
                                        <Row className="mx-auto col-md-6">
                                            <div className="col-md-10">
                                                <Field name="email" type="email" className="mb-2 form-control" />
                                            </div>
                                            <div className="col-md-2 ml-1">
                                                <button
                                                    color="success"
                                                    type="submit"
                                                    className="btn btn-success btn-md mb-2">
                                                    Subscribe!
                                                </button>
                                            </div>
                                        </Row>
                                        <Row>
                                            <div className="col pt-1">
                                                <p>Want the latest news? Get it in your inbox!</p>
                                            </div>
                                        </Row>
                                    </Form>
                                </Formik>
                            </div>
                        </Col>
                    </Row>
                </Container>
            </section>
        </React.Fragment>
    );
};

NewsletterSubscriptionForm.propTypes = {
    callSubscriptionList: PropTypes.func,
};
export default NewsletterSubscriptionForm;
