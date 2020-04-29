function VisualPerformance {
    
    if((Get-ItemProperty HKCU:\Software\hsg -Name bogus -ea 0).bogus) {'Propertyalready exists'}

    ELSE { Set-ItemProperty -Path HKCU:\Software\hsg -Name bogus -Value'initial value'}

}
