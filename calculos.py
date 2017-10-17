

def distanciaMedia (lista_valores):
    soma = sum(list(lista_valores))
    dist_media = soma/len(lista_valores)
    return dist_media

def distanciaResultante(AP, ML):
    distancia_result = []

    for i in range(len(AP)):
        DR = sqrt((AP[i]**2)+(ML[i]**2))
        distancia_result.append(DR)
    return distancia_result

def distanciaResultanteParcial(APouML):
    distancia_resultparcial = []

    for i in range(len(APouML)):
        #distancia_resultparcial
        DR = sqrt(APouML[i]**2)
        distancia_resultparcial.append(DR)
    return distancia_resultparcial

def dist_RMS (dist_resultante):
    d_R_quadrada =[]
    for _ in range(len(dist_resultante)):
        dist_result_quadrada = (dist_resultante[_]**2)
        d_R_quadrada.append(dist_result_quadrada)
    soma = sum(list(d_R_quadrada))
    disRMS =sqrt(soma/len(dist_resultante))
    return disRMS

def geraAP_ML(valx, valy):
    soma_AP0 = soma_ML0 = 0.0
    valores_AP = []
    valores_ML = []

    for ele in range(len(valy)):
        soma_AP0 = soma_AP0 + valx[ele]
        soma_ML0 = soma_ML0 + valy[ele]

    AP_barra = soma_AP0 / len(valx)
    ML_barra = soma_ML0 / len(valy)

    for i in range(len(valy)):
        ap = valx[i] - AP_barra
        ml = valy[i] - ML_barra
        valores_AP.append(ap)
        valores_ML.append(ml)
    return valores_AP, valores_ML

from random import*
#Gera números aleatórios entre o intervalo x_inicial até x_final
def geraNumeroAleatorio(x_Inicial, x_Final, y_Inicial, y_Final, N):
    valores_x =[]
    valores_y =[]
    for i in range(N):
        x = uniform(x_Inicial, x_Final)
        y = uniform(y_Inicial, y_Final)
        valores_x.append(x)
        valores_y.append(y)
    return valores_x, valores_y

def mVelo(totex, tempo):
    velocidademedia = totex/tempo
    return velocidademedia

from math import sqrt
def totex(AP, ML):
    dist = []
    for i in range(len(AP)-1):
        distancia = sqrt((AP[i+1] - AP[i])**2 + (ML[i+1] - ML[i])**2)
        dist.append(distancia)
    Totex = sum(list(dist))
    return Totex


def totexParcial(APouML):
    dist = []
    for i in range(len(APouML)-1):
        distancia = sqrt((APouML[i+1] - APouML[i])**2)
        dist.append(distancia)
    Totexparcial = sum(list(dist))
    return Totexparcial

#retorna o maior valor absoluto de dois elementos
def valorAbsoluto(minimo, maximo):
    if abs(minimo) > abs(maximo):
        return abs(minimo)
    else:
        return abs(maximo)

#retorna True caso seja diferentes
def diferentes(APs , Mls):
    if len(APs)!= len(Mls):
        return True
    return False

def delEleAP(AP, pos):
    for i in range(len(pos)):
        del AP[pos[i]]
    return AP

def delEleML(ML, pos):
    for i in range(len(pos)):
        del ML[pos[i]]
    return ML

def gsc(readings, pos, named_calibration):
	reading = readings[pos]
	calibration = named_calibration[pos]
	
	if reading < calibration[1]:
		return 1700 * (reading - calibration[0]) / (calibration[1] - calibration[0])
	else:
		return 1700 * (reading - calibration[1]) / (calibration[2] - calibration[1]) + 1700

def calcweight( readings, calibrations ):
	"""
	Determine the weight of the user on the board in hundredths of a kilogram
	"""
	weight = 0
	for sensor in ('right_top', 'right_bottom', 'left_top', 'left_bottom'):
		reading = readings[sensor]
		calibration = calibrations[sensor]
		#if reading < calibration[0]:
		#	print "Warning, %s reading below lower calibration value" % sensor
		if reading > calibration[2]:
			print ("Warning, %s reading above upper calibration value" % sensor)
		# 1700 appears to be the step the calibrations are against.
		# 17kg per sensor is 68kg, 1/2 of the advertised Japanese weight limit.
		if reading < calibration[1]:
			weight += 1700 * (reading - calibration[0]) / (calibration[1] - calibration[0])
		else:
			weight += 1700 * (reading - calibration[1]) / (calibration[2] - calibration[1]) + 1700

	return weight/100

def calcIMC(weight, size):
    return (weight /(size**2))
