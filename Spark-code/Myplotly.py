#------------------import library -------------------
import plotly
#----------------------------------------------------
class Myplotly:
#----------------------------------------------------------------------------
    def DrawGraph(plot_dic, height=1000, width=700, **kwargs):
        kwargs['output_type'] = 'div'
        kwargs['image_height'] = height
        kwargs['image_width'] = width
        kwargs['show_link'] = True        
        plot_str =  plotly.offline.plot(plot_dic, **kwargs)
        plot_str = plot_str.replace('.modebar":"','.modebar":"width:auto;')
        plot_str = plot_str.replace('.modebar-group":"','.modebar-group":"width:auto;')
        plot_str = plot_str.replace('.modebar-btn":"','.modebar-btn":"float: left; display: inline-block;')        
        print('%%angular <div style="height: %ipx; width: %spx"> %s </div>' % (height, width, plot_str))
#----------------------------------------------------------------------------

#----------------------------------------------------------------------------


#----------------------------------------------------------------------------


#----------------------------------------------------------------------------


#----------------------------------------------------------------------------
