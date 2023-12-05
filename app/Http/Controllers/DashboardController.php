<?php

namespace App\Http\Controllers;
use App\Models\Articulo;
use App\Models\User;
use App\Models\Venta;
use App\Models\Compra;
use App\Models\Inventario;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use DateTime;
use DateInterval;
use DatePeriod;
class DashboardController extends Controller
{
    public function info(){
        return [
            "articulos"=>Articulo::where('estado',1)->get()->count(),
            "usuarios"=>User::where('estado',1)->get()->count(),
            "ventas"=>Venta::where('estado',1)->get()->sum('total'),
            "compras"=>Compra::where('estado',1)->get()->sum('total'),
            "ventameses"=>$this->VentasMensual(),
            "comprameses"=>$this->ComprasMensual(),
            "ventasdias"=>$this->VentasDiarias(),
            "comprasdias"=>$this->ComprasDiarias(),
            "promedioInventario"=>$this->PromedioInventario(),
        ];
    }
    public function VentasMensual()
    {
        $nombresMeses = [
            'ENE', 'FEB', 'MAR', 'ABR', 'MAY', 'JUN', 'JUL', 'AGO', 'SEP', 'OCT', 'NOV', 'DIC'
        ];

        $ventasMensuales = [];
        foreach ($nombresMeses as $mes) {
            $ventasMensuales[] = [
                'mes' => sprintf('%02d', array_search($mes, $nombresMeses) + 1) . '.' . $mes,
                'total' => 0,
                'año' => date('Y'),
            ];
        }
        $ventas = Venta::select(
            DB::raw('SUM(total) as total'),
            DB::raw('DATE_FORMAT(created_at, "%m") as numero_mes'),
            DB::raw('DATE_FORMAT(created_at, "%Y") as año')
        )
            ->where('estado', 1)
            ->groupBy('numero_mes', 'año')
            ->get();

        foreach ($ventas as $venta) {
            $numeroMes = intval($venta->numero_mes);
            $ventasMensuales[$numeroMes - 1] = [
                'mes' => sprintf('%02d', $numeroMes) . '.' . $nombresMeses[$numeroMes - 1],
                'total' => $venta->total,
                'año' => $venta->año,
            ];
        }
        return $ventasMensuales;
    }




    public function ComprasMensual()
    {
        $compras = Compra::select(
            DB::raw('SUM(total) as total'),
            DB::raw("CONCAT(LPAD(DATE_FORMAT(created_at, '%m'), 2, '0'), '-', DATE_FORMAT(created_at, '%b')) as mes"),
            DB::raw("DATE_FORMAT(created_at, '%Y') as año")
        )->where('estado', 1)
        ->groupBy('mes', 'año')
        ->get();
            return $compras;
    }
    public function VentasDiarias()
    {
        $ventas = Venta::select(
            DB::raw('SUM(total) as total'),
            DB::raw("DATE_FORMAT(created_at, '%Y-%m-%d') as fecha")
        )->where('estado', 1)
        ->groupBy('fecha')
        ->get();

        return $ventas;
    }
    public function ComprasDiarias()
    {
        $compras = Compra::select(
            DB::raw('SUM(total) as total'),
            DB::raw("DATE_FORMAT(created_at, '%Y-%m-%d') as fecha")
        )->where('estado', 1)
        ->groupBy('fecha')
        ->get();

        return $compras;
    }
public function PromedioInventario()
{
    $nombresMeses = [
        'ENE', 'FEB', 'MAR', 'ABR', 'MAY', 'JUN', 'JUL', 'AGO', 'SEP', 'OCT', 'NOV', 'DIC'
    ];
    $nombresNumero = [
        1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12
    ];
    // Obtener los datos de inventario
    $inventario = Inventario::select(
        DB::raw('DATE_FORMAT(created_at, "%Y-%m-%d") as fecha'),
        DB::raw('SUM(CASE WHEN tipo = 1 THEN cantidad ELSE 0 END) as ingresos'),
        DB::raw('SUM(CASE WHEN tipo = 2 THEN cantidad ELSE 0 END) as egresos')
    )
        ->where('estado', 1)
        ->groupBy('fecha')
        ->get();

    $promedioPorMes = [];

    foreach ($nombresNumero as $mes) {
        $inventarioMes = $inventario->filter(function ($item) use ($mes) {
            $numeroMes = date('m', strtotime($item->fecha));

            return $numeroMes == $mes;
        });

        $promedio = $inventarioMes->isEmpty() ? 0 : $inventarioMes->avg(function ($item) {
            return ($item->ingresos + $item->egresos) / 2;
        });

        $promedioPorMes[] = [
            'fecha' => sprintf('%02d', $mes) . '.' . $nombresMeses[$mes - 1], // Formato '01.ene'
            'promedio_inventario' => $promedio,
        ];
    }

    return $promedioPorMes;
}

}