{smcl}
{* 01 Feb 2024}{...}
{hline}
help for {hi:iegraph}
{hline}

{title:Title}

{phang2}{cmdab:iegraph} {hline 2} Generates graphs based on regressions with treatment dummies common in impact evaluations.

{phang2}For a more descriptive discussion on the intended usage and work flow of this
command please see the {browse "https://dimewiki.worldbank.org/wiki/Iegraph":DIME Wiki}.

{title:Syntax}

{phang2}
{cmdab:iegraph} {varlist}
, [
{cmdab:basicti:tle(}{it:string}{cmd:)}
{cmdab:varl:abels}
{cmdab:save(}{it:string}{cmd:)}
{cmdab:gray:scale}
{cmdab:yzero}
{cmdab:barl:abel}
{cmdab:mlabc:olor:(}{it:{help colorstyle:colorname}}{cmd:)}
{cmdab:mlabp:osition:(}{it:{help clockposstyle:clockpos}}{cmd:)}
{cmdab:mlabs:ize:(}{it:{help textsizestyle:size}}{cmd:)}
{cmd:barlabelformat}
{cmd:noconfbars}
{cmdab:confbarsnone(}{it:varlist}{cmd:)}
{cmdab:confintval(}{it:numlist}{cmd:)}
{cmd:norestore}
{cmdab:baropt:ions(}{it:string}{cmd:)}
{cmdab:ignoredummytest}
{it:{help scatter##twoway_options:twoway_scatter_options}}
]

{marker opts}{...}
{synoptset 22}{...}
{synopthdr:options}
{synoptline}
{synopt :{cmdab:basicti:tle(}{it:string}{cmd:)}} Manually sets the title of the graph.{p_end}
{synopt :{cmdab:varl:abels}} Uses variable labels for legends instead of variable names.{p_end}
{synopt :{cmdab:save(}{it:string}{cmd:)}} Sets the filename and the directory to which the graph will be set/exported.{p_end}
{synopt :{cmdab:gray:scale}} Uses grayscales for the bars instead of colors.{p_end}
{synopt :{cmdab:yzero}} Forces y-axis on the graph to start at 0.{p_end}
{synopt :{cmdab:barl:abel}} Adds a label on top of the bars with their respective values.{p_end}
{synopt :{opth barc:olors(colornames)}} Manually set the colors of the bars.{p_end}
{synopt :{cmdab:mlabc:olor:(}{it:{help colorstyle:colorname}}{cmd:)}} Set color of bar label.{p_end}
{synopt :{cmdab:mlabp:osition:(}{it:{help clockposstyle:clockpos}}{cmd:)}} Set position of bar label.{p_end}
{synopt :{cmdab:mlabs:ize:(}{it:{help textsizestyle:size}}{cmd:)}} Set font size of bar label.{p_end}
{synopt :{cmd:barlabelformat}} Customizes format of bar label. Must be used with {it:barlabel}.{p_end}
{synopt :{cmd:noconfbars}} Removes the confidence interval bars from graphs for all treatments.{p_end}
{synopt :{cmdab:confbarsnone(}{it:varlist}{cmd:)}} Removes confidence interval bars from only the {it:varlist} listed.{p_end}
{synopt :{cmdab:confintval(}{it:numlist}{cmd:)}} Sets the confidence interval for the confidence interval bars. Default is .95.{p_end}
{synopt :{cmd:norestore}} Allows you to debug your two way graph settings on the data set prepared by iegraph. To be used with {it:r(cmd)}.{p_end}
{synopt :{cmdab:baropt:ions(}{it:string}{cmd:)}} Allows you to add formatting to the bars.{p_end}
{synopt :{cmdab:ignoredummytest}} Ignores the tests that tests if the dummies fits one of the two models below.{p_end}
{synoptline}

{pstd}Any twoway graph scatter options that can be used with normal twoway graph scatter commands can
	also be used. If any of these commands conflict with any of the built in options,
	then the user specified settings have precedence. See example 2 for details.{p_end}

{marker desc}
{title:Description}

{pstd}{cmdab:iegraph} This command creates bar graphs on the basis of the coefficients
	of treatment dummies in regression results. This command is developed for reading
	stored results from two types of impact evaluation regression models, but there
	are countless of other examples where the command also can be used. {cmd:iegraph} must
	be used immediately after running the regression or as long as the regression result is
	still stored in or restored to Stata's {help ereturn} results.

{pstd}{bf:Model 1: OLS with Treatment Dummies}{break}The most typical impact evaluation regression is
	to have the outcome variable as the dependent variable and one dummy for each
	treatment arm where control is the omitted category. These regressions can also include
	covariates, fixed effects etc., but as long as the treatment status is defined by
	mutually exclusive dummy variables. See especially examples 1 and 2 below. This command
	works with any number of treatment arms but works best from two arms (treatment
	and control) to five treatment arms (4 different treatments and control). More
	arms than that may result in a still correct but perhaps cluttered graph.

{pstd}{bf:Model 2: Difference-in-Differences}{break}Another typical regression model in impact
	evaluations are difference-in-difference (Diff-in-Diff) models with two treatment arms (treatment
	and control) and two time periods. If the Diff-in-Diff regression is specified as having the
	outcome variable as the dependent variable and three dummy variables (time, treatment
	and time*treatment) as the independent variables, then this command will produce a nice
	graph. Controls, treatment effects etc. may be added to the regression model. See especially example 3.

{pstd}{bf:Graph Output}{break}The graph generated by this command is created using the following values. The
	control bar is the mean of the outcome variable for the control group. It is not
	the constant from the regression as those are not identical if, for example, fixed effects
	and covariates were used. For each treatment group the bar is the sum of the value
	of the control bar and the beta coefficient in the regression of the corresponding
	treatment dummy. The confidence intervals are calculated from the variance in the
	beta coefficients in the regression.{p_end}

{pstd}The graph also includes the N for each treatment arm in the regression and uses
	that value as labels on the x-axis. Stars are added to this value if the corresponding
	coefficient is statistically different from zero in the regression{p_end}

{marker optslong}
{title:Options}

{phang}{cmdab:basicti:tle(}{it:string}{cmd:)} Manually sets the title of the graph. To
	apply formatting like title size, position, etc., use Stata's built
	in {help title_options:title() option} instead.{p_end}

{phang}{cmdab:varl:abels} Sets the legends to the variable labels for the
	variables instead of the variable names.{p_end}

{phang}{cmdab:save(}{it:string}{cmd:)} Sets the filename and the directory to which
	the graph will be set. If the filename ends with no extension or '.gph', it will be
	saved in the graph format. Extensions(png, pdf, tif, wmf, emf, ps, and eps) will be exported.
	wmf and emf are only available for the Windows version of Stata. Png and Tif for all
	versions of Stata except Console.{p_end}

{phang}{cmdab:gray:scale} Uses grayscale for the bars instead of colors. The color
	of the control bar will be black and the treatment bar will run in equal shade
	differences from light grey to dark grey.{p_end}

{phang}{cmdab:yzero} Manually sets the y-axis of the graph to start at zero
	instead of the Stata default. In many cases, we expect that neither the default
	settings nor this option will make the axes look perfect, but you may use Stata's built
	in {help axis_option:axis options} that allow you to set the axes to perfectly fit
	your data. The command will ignore the {cmdab:yzero} option in cases where the graph cannot
	be forced to zero i.e. where the values in the graph extend beyond zero, both positively
	or negatively. A warning will be displayed telling the user that the option has
	been ignored. Despite the warning, the graph will be produced correctly.{p_end}

{phang}{cmdab:barl:abel} Adds a label on top of the bars with their respective values. Equivalent
	to specifying option {help help blabel_option:blabel(bar)} in a
	{help graph_bar: bar graph}. {p_end}

{phang}{opt barc:olors(string)} manually sets the colors of the bars.
All color names listed in {help colorstyle} are allowed.
If there are more groups than colors listed,
then the list of colors will be repeated.
If color codes such as {it:"255 255 191"} is used,
then the string must use compounded quotes {inp: `""'}.
For example: {opt barcolors(`" red  "215 25 28" gs14 "')}.{p_end}

{phang}{cmdab:mlabc:olor:(}{it:{help colorstyle:colorname}}{cmd:)}
Set color of bar label. May only be used with {it:barlabel}.{p_end}

{phang}{cmdab:mlabp:osition:(}{it:{help clockposstyle:clockpos}}{cmd:)}
Set position of bar label. May only be used with {it:barlabel}.{p_end}

{phang}{cmdab:mlabs:ize:(}{it:{help textsizestyle:size}}{cmd:)}
Set font size of bar label. May only be used with {it:barlabel}.{p_end}

{phang}{cmd:barlabelformat} Customize barlabel format. Must be used with {it:barlabel}.
Options allowed have the formats %#.#f or %#.#e.
Default if %9.1f. See {help format} for more information. {p_end}

{phang}{cmd:noconfbars} Removes the confidence interval bars from graphs for all
	treatments. The default value for the confidence interval bars is 95%. {p_end}

{phang}{cmdab:confbarsnone(}{it:varlist}{cmd:)} Removes confidence interval bars
	from only the {it:varlist} listed. The remaining variables in the graphs which
	have not been specified in {cmdab:confbarsnone} will still have the confidence
	interval bars. {p_end}

{phang}{cmdab:confintval(}{it:numlist}{cmd:)} Sets the confidence interval for
	the confidence interval bars. Default is .95. Values between 0 and 1 are allowed.{p_end}

{phang}{cmdab:norestore} Returns the data set that iegraph prepares to create
	the graph. This is helpful when de-bugging how one of Stata's many graph
	options can be applied to an iegraph graph. This option is meant to be
	used in combination with the {help return:returned result} in {it:r(cmd)}. {it:r(cmd)}
	gives you the line of code iegraph prepares to create the graph and {cmdab:norestore} gives you
	access to the data that code is meant to be used on. This approach will help
	you de-bug how to apply Stata's built in graph options to an iegraph graph.
	Note that this option deletes any unsaved changes made to your data.{p_end}

{phang}{cmdab:baropt:ions(}{it:string}{cmd:)} Allows you to add formatting
	option that are applied to each bar and not the graph itself. Example of
	such option are {help twoway_bar} options and {help axis_options} options.
  It is not possible to use this option to add formatting to individual bars.
  Everything added in this option is added to all bars.
  Formatting added in this option takes precedence over
  any default formatting or formatting set in any other option.{p_end}

{phang}{cmd:ignoredummytest} Ignores the tests that test if the dummies fits one
	of the two models this command is intended for. The two models are described
	in detail above above. There might be models we have not thought of for which
	this command is helpful as well. Use this option to lift the restrictions of
	those two models. But be careful, this command has not been tested for other
	models than the two described.{p_end}

{marker optslong}
{title:Examples}

{pstd} {hi:Example 1.}

{pmore} {inp:regress} {it:outcomevar treatment_dummy}{break}
		{inp:iegraph} {it:treatment_dummy} , {inp:basictitle({it:"Treatment Effect on Outcome"})}

{pmore}In the example above, there are only two treatment arms (treatment and
		control). {it:treatment_dummy} has a 1 for all treatment observations and
		a 0 for all control observations. The graph will have one bar for control and
		it shows the mean for {it:outcomevar} for all observations in control. The
		second bar in the graph will be the sum of that mean and the coefficient
		for {it:treatment_dummy} in the regression. The graph will also have the
		title: Treatment Effect on Outcome.

{pstd} {hi:Example 2.}

{pmore} {inp:regress} {it:income tmt_1 tmt_2 age education}{inp:, cluster(}{it:district}{inp:)}{break}
		{inp:iegraph} {it:tmt_1 tmt_2}{inp:, noconfbars yzero basictitle({it:"Treatment effect on income"}) }

{pmore}In the example above, the treatment effect on income in researched. There
		are three treatment arms; control, treatment 1 ({it:tmt_1}) and treatment
		2 ({it:tmt_2}). It is important that no observation has the value 1 in
		both {it:tmt_1} and {it:tmt_2} (i.e. no observation is in more than one
		treatment) and some observations must have the value 0 in both {it:tmt_1}
		and {it:tmt_2} (i.e. control observations). The variables {it:age} and
		{it:education} are covariates (control variables) and are not included
		in {cmd:iegraph}. {inp:noconfbars} omits the confidence interval bars
		, and {inp:yzero} sets the y-axis to start at 0.

{pstd} {hi:Example 3.}

{pmore} {inp:regress} {it:chld_wght time treat timeXtreat}{break}
		{inp:iegraph} {it:time treat timeXtreat} {inp:, basictitle({it:"Treatment effect on Child Weight (Diff-in-Diff)"})}

{pmore}In the example above, the data set is a panel data set with two time
		periods and the regression estimates the treatment effect on child weight
		using a Difference-in-Differences model.
		The dummy variable {it:time} indicates if it is time period 0 or 1.
		The dummy variable {it:treat} indicates if the observation is treatment
		or control. {it:timeXtreat} is the interaction term of {it:time}
		and {it:treat}. This the standard way to set up a Difference-in-Differences
		regression model.

{pstd} {hi:Example 4.}

{pmore} {inp:regress} {it:harvest T1 T2 T3 } {break}
		{inp:iegraph} {it:T1 T2 T3} {inp:, basictitle({it:"Treatment effect on harvest"})}
		xlabel(,angle(45)) yzero ylabel(minmax) save({it:"Graph1.gph"})}

{pmore}The example above shows how to save a graph to disk. It also shows that
	most two-way graph options can be used. In this example the {cmd:iegraph}
	option {cdm:yzero} conflicts with the two-way option {cmd:ylabel(minmax)}.
	In such a case the user specified option takes precedence over {cmd:iegraph}
	options like {cdm:yzero}.


{title:Acknowledgements}

{phang}We would like to acknowledge the help in testing and proofreading we received in relation to this command and help file from (in alphabetic order):{p_end}
{pmore}Michael Orevba{break}Ahmad Zia Wahdat{break}

{title:Author}

{phang}All commands in ietoolkit is developed by DIME Analytics at DECIE, The World Bank's unit for Development Impact Evaluations.

{phang}Main author: Kristoffer Bjarkefur, Mrijan Rimal, Luiza Cardoso De Andrade, DIME Analytics, The World Bank Group

{phang}Please send bug-reports, suggestions and requests for clarifications
		 writing "ietoolkit iegraph" in the subject line to:{break}
		 dimeanalytics@worldbank.org

{phang}You can also see the code, make comments to the code, see the version
		 history of the code, and submit additions or edits to the code through {browse "https://github.com/worldbank/ietoolkit":the GitHub repository of ietoolkit}.{p_end}
