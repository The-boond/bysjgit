
                import { createRouter, createWebHashHistory } from "vue-router";
                import NProgress from "nprogress";
                import { useStore } from "@/store";
                const routes = [
                {
                    path: "/",
                    redirect: "/index",
                },
                {
                    path: "/home",
                    name: "Home",
                    redirect: "/register",
                    component: () => import("@/views/Home/index.vue"),
                    children: [
                    {
                        path: "/index",
                        name: "Index",
                        component: () => import("@/views/Index/index.vue"),
                    },
                    {
                        path: "/login",
                        name: "Login",
                        component: () => import("@/views/Login/index.vue"),
                    },
                    {
                        path: "/register",
                        name: "Register",
                        component: () => import("@/views/Register/index.vue"),
                    },
                    {
                        path: "/announcement",
                        name: "Announcement",
                        component: () => import("@/views/Announcement/index.vue"),
                    },
                    {
                        path: "/announcementDetails",
                        name: "AnnouncementDetails",
                        component: () => import("@/views/AnnouncementDetails/index.vue"),
                    },
                    {
                        path: "/abouts",
                        name: "Abouts",
                        component: () => import("@/views/Abouts/index.vue"),
                    },
                    
            {
                path: "/myProfile",
                name: "MyProfile",
                redirect: "/personal",
                component: () => import("@/views/MyProfile/index.vue"),
                children: [
                    
                {
                    path: "/personal",
                    name: "Personal",
                    component: () => import("@/views/MyProfile/Personal/index.vue"),
                }
                ,
                {
                    path: "/changePassword",
                    name: "ChangePassword",
                    component: () => import("@/views/MyProfile/ChangePassword/index.vue"),
                }
                ,
                {
                    path: "/myCollect",
                    name: "MyCollect",
                    component: () => import("@/views/MyProfile/MyCollect/index.vue"),
                }
                
                ]
            },
        
                     {
                        path: '/customerService',
                        name: 'CustomerService',
                        component: () => import('@/views/CustomerService/index.vue'),
                    },
                   
                    
                        {
                            path: "/salariessClassify",
                            name: "SalariessClassify",
                            component: () => import("@/views/Pages/SalariessClassify/index.vue"),
                        }
                        ,
                        {
                            path: "/kaoQIn",
                            name: "KaoQIn",
                            component: () => import("@/views/Pages/KaoQIn/index.vue"),
                            
                          },
                        {
                            path: "/officesuppliesClassify",
                            name: "OfficesuppliesClassify",
                            component: () => import("@/views/Pages/OfficesuppliesClassify/index.vue"),
                        }
                        ,
                        {
                            path: "/informationssClassify",
                            name: "InformationssClassify",
                            component: () => import("@/views/Pages/InformationssClassify/index.vue"),
                        }
                        ,
                        {
                            path: "/informationss",
                            name: "Informationss",
                            component: () => import("@/views/Pages/Informationss/index.vue"),
                        },
                        {
                            path: "/salariess",
                            name: "Salariess",
                            component: () => import("@/views/Pages/Salariess/index.vue"),
                        }
                        ,
                        {
                            path: "/officesupplies",
                            name: "Officesupplies",
                            component: () => import("@/views/Pages/Officesupplies/index.vue"),
                        }
                        ,
                        {
                            path: "/itemapplicationCreate",
                            name: "ItemapplicationCreate",
                            component: () => import("@/views/Pages/ItemapplicationCreate/index.vue"),
                        }
                    ,
                        {
                            path: "/informationssCreate",
                            name: "InformationssCreate",
                            component: () => import("@/views/Pages/InformationssCreate/index.vue"),
                        }
                    ,
                    {
                        path: "/claimsCreate",
                        name: "ClaimsCreate",
                        component: () => import("@/views/Pages/ClaimsCreate/index.vue"),
                    }
                ,
                {
                    path: "/workplanCreate",
                    name: "WorkplanCreate",
                    component: () => import("@/views/Pages/WorkplanCreate/index.vue"),
                }
            ,
                        {
                            path: "/leavessCreate",
                            name: "LeavessCreate",
                            component: () => import("@/views/Pages/LeavessCreate/index.vue"),
                        }
                    ,
                    {
                        path: "/rests",
                        name: "Rests",
                        component: () => import("@/views/Pages/Rests/index.vue"),
                        redirect: "informationssList",
                        children: [
                       
                        {
                            path: "/informationssList",
                            name: "InformationssList",
                            component: () => import("@/views/Pages/Rests/InformationssList/index.vue"),
                        }
                    ,
                        
                        {
                            path: "/itemapplicationList",
                            name: "ItemapplicationList",
                            component: () => import("@/views/Pages/Rests/ItemapplicationList/index.vue"),
                        }
                    ,
                        
                        {
                            path: "/claimsList",
                            name: "ClaimsList",
                            component: () => import("@/views/Pages/Rests/ClaimsList/index.vue"),
                        }
                    ,
                       
                        {
                            path: "/workplanList",
                            name: "WorkplanList",
                            component: () => import("@/views/Pages/Rests/WorkplanList/index.vue"),
                        }
                    ,
                        
                        {
                            path: "/leavessList",
                            name: "LeavessList",
                            component: () => import("@/views/Pages/Rests/LeavessList/index.vue"),
                        },
                        {
                            path: "/salariessList",
                            name: "SalariessList",
                            component: () => import("@/views/Pages/Rests/SalariessList/index.vue"),
                        }
                    ]
                    }
                
                    ],
                },
                ];
                const router = createRouter({
                history: createWebHashHistory(),
                routes,
                });
                // 全局守卫 路由进入前
                router.beforeEach(async (to, from, next) => {
                let useState = useStore();
                NProgress.start();
                let resultFlag = await useState.IsLogin();
                if (resultFlag) {
                    useState.OnlineSocket(useState.$state.userid);
                    next();
                } else next();
                });
                // 全局守卫 路由离开
                router.afterEach((_to) => {
                let useState = useStore();
                useState.SetOnlineServiceIsShow(false);
                NProgress.done();
                });
                export default router;
            