/*
 * This file is part of ThinkTwice.
 * 
 * Copyright (c) 2016 Antoine Drouhin <antoine.drouhin@gmail.com>, Geoffrey Harrazi <geoffreyharrazi@gmail.com>, Annas Saker
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 */

var Facette = function (id_personne, reponses, next) {
    this.id_personne = id_personne;
    this.reponses = reponses;
    this.next = next;
}


Facette.prototype.calc = function () {
    console.log("Calc facette in progress...");

    //delete personne_facette de cette personne
    var query = "delete from personne_facette where personneid = ?";
    var con = global.con();
    var $this = this;
    con.query(query,[$this.id_personne],function(err,rows){
        if(err){
            Utils.info(err);

        }

        //recuperation de typeBaremeid et de facetteid
        query = "select id, typeBaremeid, facetteid FROM question";
        con.query(query,function(err,rows){
            if(err){
                Utils.info(err);

            }
            var tabQuestion = rows;
            tabQuestion['reponses'] = new Array();
            //Initialisation de reponse
            //BEGIN:POUR TEST A REMOVE
            for(var i = 0; i<tabQuestion.length;i++){
                tabQuestion['reponses'][i] = 0;
            }
            //END:POUR TEST A REMOVE
            for(var i = 0; i<$this.reponses.length;i++){
                tabQuestion['reponses'][i] = $this.reponses[i].reponse;
            }

            query =  "select * from facette";
            con.query(query,function(err,rows){
                if(err){
                    Utils.info(err);

                }
                var tabFacette = rows;
                var mapFacette = {};


                //Initialisation de ma map avec comme clef l'id de la facette en en value une initialisation à 0
                for(var i = 0; i<tabFacette.length;i++){
                    mapFacette[tabFacette[i].id]=0;
                }

                var parametreRep = new Array(new Array('FD','D','N','A','FA'), new Array(4,3,2,1,0), new Array(0,1,2,3,4));


                for(var i = 0; i<tabQuestion.length;i++){

                    mapFacette[tabQuestion[i].facetteid]=mapFacette[tabQuestion[i].facetteid]+parametreRep[tabQuestion[i].typeBaremeid][tabQuestion.reponses[i]];

                }


                //insert dans personne_facette
                var j = 0;
                //for (var val in mapFacette) {

                for (var k = 0; k<tabFacette.length;k++) {

                    query = "INSERT INTO personne_facette (score,facetteid,personneid) VALUES (?,?,?)";
                    var score = mapFacette[tabFacette[k].id];
                    con.query(query,[score, tabFacette[k].id, $this.id_personne],function(err,rows){
                        console.log(err);
                        console.log($this.id_personne);
                        console.log(tabFacette.length);
                        console.log(j);
                        console.log(mapFacette);
                        if(err){
                            Utils.info(err);

                        }

                        j++;
                        if (j >= (tabFacette.length)) {
                            $this.next($this.id_personne, $this.reponses);
                        }

                    })

                }

            })
        })
    })


}

module.exports = Facette;