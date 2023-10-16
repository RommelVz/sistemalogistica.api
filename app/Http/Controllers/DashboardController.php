<?php

namespace App\Http\Controllers;
use App\Models\Articulo;
use App\Models\User;
use App\Models\Venta;
use App\Models\Compra;
use App\Models\Inventario;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

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
        $ventas = Venta::select(
            DB::raw('SUM(total) as total'),
            DB::raw("CONCAT(LPAD(DATE_FORMAT(created_at, '%m'), 2, '0'), '-', DATE_FORMAT(created_at, '%b')) as mes"),
            DB::raw("DATE_FORMAT(created_at, '%Y') as año")
        )->where('estado', 1)
        ->groupBy('mes', 'año')
        ->get();
            return $ventas;
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
        $inventario = Inventario::select(
            DB::raw('DATE_FORMAT(created_at, "%Y-%m-%d") as fecha'),
            DB::raw('SUM(CASE WHEN tipo = 1 THEN cantidad ELSE 0 END) as ingresos'),
            DB::raw('SUM(CASE WHEN tipo = 2 THEN cantidad ELSE 0 END) as egresos')
        )
            ->where('estado', 1)
            ->groupBy('fecha')
            ->get();

        // Ahora que tenemos los ingresos y egresos por fecha, calculamos el promedio de inventario.
        $promedioInventario = $inventario->map(function ($item) {
            return [
                'fecha' => $item->fecha,
                'promedio_inventario' => ($item->ingresos + $item->egresos) / 2,
            ];
        });

        return $promedioInventario;
    }

}
