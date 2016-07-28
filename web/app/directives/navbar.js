/*
 * This file is part of ThinkTwice.
 * 
 * Copyright (c) 2016 Antoine Drouhin <antoine.drouhin@gmail.com>, Geoffrey Harrazi <geoffreyharrazi@gmail.com>, Annas Saker
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 */

'use strict';

angular.module('thinktwiceApp')
    .directive('navbar' ,function () {
        return {
            restrict: 'E',
            templateUrl: 'app/views/directives/navbar.html',
            link: function (scope) {
                scope.state = scope.$state;
                scope.deconnection = function () {
                    window.localStorage.removeItem('thinktwice_token');
                    document.location.href =  '#login';
                };
                scope.goProfil = function () {
                    document.location.href =  '#profil';
                };
                scope.goMatch = function () {
                    document.location.href =  '#match';
                };
            }
        }
    });
