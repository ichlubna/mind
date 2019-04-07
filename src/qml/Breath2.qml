import QtQuick 2.4

Breath2Form {
    property int numberLength: 1000
    property int transitionLength: 150

    ParallelAnimation{
         loops: Animation.Infinite
         running: true
         RotationAnimator {
                 target: sprite;
                 from: 0;
                 to: 360;
                 duration: numberLength*14+4*transitionLength
             }

    SequentialAnimation {
            ParallelAnimation{
                ScaleAnimator {
                        target: breathIn;
                        from: 0.9;
                        to: 1.0;
                        duration: numberLength*4
                    }
                ScaleAnimator {
                        target: bar;
                        from: 0.0;
                        to: 1.0;
                        duration: numberLength*4
                    }
                SequentialAnimation {
                    ParallelAnimation{
                        ScaleAnimator {
                                target: one;
                                from: 1.0;
                                to: 0.0;
                                duration: numberLength
                            }
                        OpacityAnimator {
                                 target: one;
                                 from: 0.5;
                                 to: 0.0;
                                 duration: numberLength
                        }
                    }

                    ParallelAnimation{
                        ScaleAnimator {
                                target: two;
                                from: 1.0;
                                to: 0.0;
                                duration: numberLength
                            }
                        OpacityAnimator {
                                 target: two;
                                 from: 0.5;
                                 to: 0.0;
                                 duration: numberLength
                        }
                    }

                    ParallelAnimation{
                        ScaleAnimator {
                                target: three;
                                from: 1.0;
                                to: 0.0;
                                duration: numberLength
                            }
                        OpacityAnimator {
                                 target: three;
                                 from: 0.5;
                                 to: 0.0;
                                 duration: numberLength
                        }
                    }

                    ParallelAnimation{
                        ScaleAnimator {
                                target: four;
                                from: 1.0;
                                to: 0.0;
                                duration: numberLength
                            }
                        OpacityAnimator {
                                 target: four;
                                 from: 0.5;
                                 to: 0.0;
                                 duration: numberLength
                        }
                    }
                }
            }

            ParallelAnimation{
                OpacityAnimator {
                    target: breathHold;
                    from: 0.0;
                    to: 1.0;
                    duration: transitionLength
                }
                OpacityAnimator {
                         target: breathIn;
                         from: 1.0;
                         to: 0.0;
                         duration: transitionLength
                }
                ScaleAnimator {
                        target: breathHold;
                        from: 1.0;
                        to: 0.9;
                        duration: transitionLength
                    }
            }

            ParallelAnimation{
                ScaleAnimator {
                        target: breathHold;
                        from: 0.9;
                        to: 1.0;
                        duration: numberLength*3
                    }
            SequentialAnimation {
                ParallelAnimation{
                    ScaleAnimator {
                            target: one;
                            from: 1.0;
                            to: 0.0;
                            duration: numberLength
                        }
                    OpacityAnimator {
                             target: one;
                             from: 0.5;
                             to: 0.0;
                             duration: numberLength
                    }
                }

                ParallelAnimation{
                    ScaleAnimator {
                            target: two;
                            from: 1.0;
                            to: 0.0;
                            duration: numberLength
                        }
                    OpacityAnimator {
                             target: two;
                             from: 0.5;
                             to: 0.0;
                             duration: numberLength
                    }
                }

                ParallelAnimation{
                    ScaleAnimator {
                            target: three;
                            from: 1.0;
                            to: 0.0;
                            duration: numberLength
                        }
                    OpacityAnimator {
                             target: three;
                             from: 0.5;
                             to: 0.0;
                             duration: numberLength
                    }
                }
            }}

            ParallelAnimation{
            OpacityAnimator {
                     target: breathHold;
                     from: 1.0;
                     to: 0.0;
                     duration: transitionLength
            }
            OpacityAnimator {
                target: breathOut;
                from: 0.0;
                to: 1.0;
                duration: transitionLength
            }
            ScaleAnimator {
                    target: breathOut;
                    from: 1.0;
                    to: 0.9;
                    duration: transitionLength
                }
            }

            ParallelAnimation{
                ScaleAnimator {
                        target: breathOut;
                        from: 0.9;
                        to: 1.0;
                        duration: numberLength*4
                    }
                ScaleAnimator {
                        target: bar;
                        from: 1.0;
                        to: 0.0;
                        duration: numberLength*4
                    }
            SequentialAnimation {
            ParallelAnimation{
                ScaleAnimator {
                        target: one;
                        from: 1.0;
                        to: 0.0;
                        duration: numberLength
                    }
                OpacityAnimator {
                         target: one;
                         from: 0.5;
                         to: 0.0;
                         duration: numberLength
                }
            }

            ParallelAnimation{
                ScaleAnimator {
                        target: two;
                        from: 1.0;
                        to: 0.0;
                        duration: numberLength
                    }
                OpacityAnimator {
                         target: two;
                         from: 0.5;
                         to: 0.0;
                         duration: numberLength
                }
            }

            ParallelAnimation{
                ScaleAnimator {
                        target: three;
                        from: 1.0;
                        to: 0.0;
                        duration: numberLength
                    }
                OpacityAnimator {
                         target: three;
                         from: 0.5;
                         to: 0.0;
                         duration: numberLength
                }
            }

            ParallelAnimation{
                ScaleAnimator {
                        target: four;
                        from: 1.0;
                        to: 0.0;
                        duration: numberLength
                    }
                OpacityAnimator {
                         target: four;
                         from: 0.5;
                         to: 0.0;
                         duration: numberLength
                }
            }}}

            ParallelAnimation{
            OpacityAnimator {
                     target: breathOut;
                     from: 1.0;
                     to: 0.0;
                     duration: transitionLength
            }
            OpacityAnimator {
                target: breathHold;
                from: 0.0;
                to: 1.0;
                duration: transitionLength
            }
            ScaleAnimator {
                    target: breathHold;
                    from: 1.0;
                    to: 0.9;
                    duration: transitionLength
                }}

            ParallelAnimation{
                ScaleAnimator {
                        target: breathHold;
                        from: 0.9;
                        to: 1.0;
                        duration: numberLength*3
                    }
            SequentialAnimation {
            ParallelAnimation{
                ScaleAnimator {
                        target: one;
                        from: 1.0;
                        to: 0.0;
                        duration: numberLength
                    }
                OpacityAnimator {
                         target: one;
                         from: 0.5;
                         to: 0.0;
                         duration: numberLength
                }
            }

            ParallelAnimation{
                ScaleAnimator {
                        target: two;
                        from: 1.0;
                        to: 0.0;
                        duration: numberLength
                    }
                OpacityAnimator {
                         target: two;
                         from: 0.5;
                         to: 0.0;
                         duration: numberLength
                }
            }

            ParallelAnimation{
                ScaleAnimator {
                        target: three;
                        from: 1.0;
                        to: 0.0;
                        duration: numberLength
                    }
                OpacityAnimator {
                         target: three;
                         from: 0.5;
                         to: 0.0;
                         duration: numberLength
                }
            }}}

            ParallelAnimation{
            OpacityAnimator {
                     target: breathHold;
                     from: 1.0;
                     to: 0.0;
                     duration: transitionLength
            }
            OpacityAnimator {
                     target: breathIn;
                     from: 0.0;
                     to: 1.0;
                     duration: transitionLength
            }
            ScaleAnimator {
                    target: breathIn;
                    from: 1.0;
                    to: 0.9;
                    duration: transitionLength
                }}
    }
}}
