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

Constraint{
    {Name ElectricScalarPotential;
    
