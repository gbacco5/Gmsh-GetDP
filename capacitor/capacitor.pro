/*File 'Elettrostatica.pro'

dielettrico 101
aria 102
elettrodo inferiore 103
elettrodo superiore 104
*/

Group{
    Air = Region[102];
    Diel = Region[101];
    Elet_Inf = Region[103];
    Elet_Sup = Region[104];
    Dominio = Region[{Air,Diel}];
}

Function{
    epsr[Air] = 1.;
    epsr[Diel] = 9.5;
}

/* Now, some Dirichlet conditions are defined. The name
’ElectricScalarPotential’ refers to the constraint name given in
the function space */
Constraint{
    {Name ElectricScalarPotential;
     Type Assign;
     Case{
        {Region Elet_Inf; Value 0.;}
        {Region Elet_Sup; Value 1.;}
        }
    }
}


/* The formulation used and its tools, considered as being
in a black box, can now be included */
Include "Jacobian_Lib.pro"
Include "Integration_Lib.pro"
Include "EleSta_v.pro"

// Post-processing
PostOperation{
    {Name Mappa; NameOfPostProcessing EleSta_v;
        Operation{
            Print[v,OnElementsOf Dominio, File "V.pos"];
            Print[e,OnElementsOf Dominio, File "E.pos"];
            Print[d,OnElementsOf Dominio, File "D.pos"];
        }
    }
    {Name MSTe; NameOfPostProcessing EleSta_v;
        Operation{
            Print[MSTe,OnElementsOf Dominio, File "MSTe.pos"];
        }
    }
    // {Name Campi_su_linee};
}
